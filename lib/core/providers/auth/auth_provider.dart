import 'package:financeiro/core/api/directus_api.dart';
import 'package:financeiro/core/auth/user.dart';
import 'package:financeiro/core/http/login_response.dart';
import 'package:financeiro/core/http/tenant_response.dart';
import 'package:financeiro/core/services/local_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:uuid/uuid.dart';
import 'package:financeiro/core/http/user_multiple_query_response.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:financeiro/core/http/user_response.dart';

enum AuthStatus {
  checking,
  authenticated,
  unauthenticated,
}

class AuthProvider extends ChangeNotifier {
  AuthProvider() {
    isAuthenticated();
  }

  String _token = '';
  String _refresh = '';
  User? user;

  AuthStatus authStatus = AuthStatus.checking;
  bool isLoading = false;

  void _setToken(String token, String refresh) async {
    await LocalStorage.prefs.setString('token', _token);
    await LocalStorage.prefs.setString('refresh_token', _refresh);
    notifyListeners();
  }

  Future<void> login({required String email, required String password}) async {
    try {
      // DirectusAPI.configureDio();
      final data = {'email': email, 'password': password};
      isLoading = true;
      authStatus = AuthStatus.checking;
      notifyListeners();
      final resp = await DirectusAPI.post('auth/login', data);
      final loginResponse = LoginResponse.fromMap(resp);
      _token = loginResponse.data?.accessToken ?? '';
      _refresh = loginResponse.data?.refreshToken ?? '';
      _setToken(_token, _refresh);
      authStatus = AuthStatus.authenticated;
      await _getUser();
    } catch (e) {
      user = null;
      authStatus = AuthStatus.unauthenticated;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> setAdminToken() async {
    try {
      // DirectusAPI.configureDio();
      final data = {
        'email': dotenv.env['ADMIN_EMAIL'].toString(),
        'password': dotenv.env['ADMIN_PASSWORD'].toString()
      };
      isLoading = true;
      notifyListeners();
      final resp = await DirectusAPI.post('auth/login', data);
      final loginResponse = LoginResponse.fromMap(resp);
      _token = loginResponse.data?.accessToken ?? '';
      _refresh = loginResponse.data?.refreshToken ?? '';
      _setToken(_token, _refresh);
      DirectusAPI.configureDio();
      isLoading = false;
      notifyListeners();
    } catch (e) {
      user = null;
      authStatus = AuthStatus.unauthenticated;
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> isAuthenticated() async {

    _refresh = LocalStorage.prefs.getString('refresh_token') ?? '';
    final data = {'mode': "json", 'refresh_token': _refresh};

    if (_refresh.isEmpty) {
      authStatus = AuthStatus.unauthenticated;
      notifyListeners();
      return;
    }

    try {
      await DirectusAPI.post('auth/refresh', data).then((value) {
        final loginResponse = LoginResponse.fromMap(value);
        _token = loginResponse.data?.accessToken ?? '';
        _refresh = loginResponse.data?.refreshToken ?? '';
        _setToken(_token, _refresh);
        authStatus = AuthStatus.authenticated;
      });

      if (authStatus == AuthStatus.authenticated) {
        await _getUser().then((value) => notifyListeners());
      }

    } catch (e) {
      user = null;
      authStatus = AuthStatus.unauthenticated;
      notifyListeners();
    }
  }

  Future<void> _getUser() async {
    try {
      authStatus = AuthStatus.authenticated;
      final resp = await DirectusAPI.httpGet(
          'users/me?fields=${User().getFields().join(',')}');
      final userResponse = UserResponse.fromMap(resp);
      user = userResponse.data;
    } catch (e) {
      user = null;
      authStatus = AuthStatus.unauthenticated;
    }
  }

  Future<void> _getUserPasswordCode({required String email}) async {
    try {
      String s =
          'users?fields=${User().getFields().join(',')}&filter[email][_eq]=';
      s += email;
      final resp = await DirectusAPI.httpGet(s);
      final userResponse = UserMultipleQueryResponse.fromMap(resp);
      user = userResponse.data;
    } catch (e) {
      user = null;
      authStatus = AuthStatus.unauthenticated;
    }
  }

  Future<void> _getUserResetPasswordToken(
      {required String resetPasswordToken}) async {
    try {
      String s =
          'users?fields=${User().getFields().join(',')}&filter[resetPasswordToken][_eq]=';
      s += resetPasswordToken;
      final resp = await DirectusAPI.httpGet(s);
      final userResponse = UserMultipleQueryResponse.fromMap(resp);
      user = userResponse.data;
    } catch (e) {
      user = null;
      authStatus = AuthStatus.unauthenticated;
    }
  }

  Future<bool> logout() async {
    _refresh = LocalStorage.prefs.getString('refresh_token') ?? '';
    final data = {'mode': "json", 'refresh_token': _refresh};
    try {
      await DirectusAPI.post('auth/logout', data);
      LocalStorage.prefs.remove('token');
      LocalStorage.prefs.remove('refresh_token');
      authStatus = AuthStatus.unauthenticated;
      notifyListeners();
      return true;
    } catch (e) {
      authStatus = AuthStatus.unauthenticated;
      notifyListeners();
      return false;
    }
  }

  Future requestPassword({required String email}) async {
    try {
      isLoading = true;
      notifyListeners();
      await setAdminToken();
      await _getUserPasswordCode(email: email);
      final data = {
        'mail': email,
        // 'url': 'https://sandbox-financeiro.vercel.app/resetPassword',
        'url': 'http://localhost:46025/resetPassword',
        'code': user?.resetPasswordToken
        //resetPassword/21ce09f5-c27d-40fe-a4ff-aa41c625ae3a
      };
      await DirectusAPI.post(
          'flows/trigger/5aa1253e-d66c-4c6b-9f5f-f1c87308e307', data);
      await logout();
      isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      await logout();
      isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future resetPassword(String newPassword, String resetPasswordToken) async {
    try {
      isLoading = true;
      notifyListeners();
      await setAdminToken();
      await _getUserResetPasswordToken(resetPasswordToken: resetPasswordToken);
      final data = {'password': newPassword};
      String s = "users/";
      s += user!.id!;
      await DirectusAPI.patch(s, data);
      await logout();
      isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      await logout();
      isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future registerNewTenant(
      {required String email,
      required String password,
      required String tenantName,
      required String userName,
      required String userLastname}) async {
    try {
      isLoading = true;
      await setAdminToken();
      final tenantData = {'name': tenantName};
      notifyListeners();
      final resp = await DirectusAPI.post('items/tenant', tenantData);
      final tenantResponse = TenantResponse.fromMap(resp);
      final registerData = {
        'first_name': userName,
        'last_name': userLastname,
        'role': dotenv.env['ROLE_TENANT'].toString(),
        'tenant': tenantResponse.data?.id ?? '',
        'email': email,
        'password': password,
        'resetPasswordToken': const Uuid().v4(),
        'avatar': dotenv.env['DEFAULT_AVATAR_ASSET'].toString(),
      };
      await DirectusAPI.post('users', registerData);
      await login(email: email, password: password);
      isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future registerUserFromTenant() async {}
}
