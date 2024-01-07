import 'package:dio/dio.dart';
import 'package:financeiro/core/services/local_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DirectusAPI {
  static final Dio _dio = Dio();

  static void configureDio() {
    final tok = LocalStorage.prefs.getString('token') ?? '';
    _dio.options.baseUrl = dotenv.env['HOST_DIRECTUS'].toString();
    _dio.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $tok',
    };
  }

  static Future httpGet(String path) async {
    try {
      configureDio();
      final response = await _dio.get(path);
      return response.data;
    } on DioException {
      rethrow;
    }
  }

  static Future post(String path, Map<String, dynamic> data) async {
    try {
      final response = await _dio.post(path, data: data);
      return response.data;
    } on DioException catch (e) {
      if (e.response != null && e.response!.data != null) {
        throw e.response!.data;
      } else {}
      rethrow;
    }
  }

  static Future postFormData(String path, FormData formData) async {
    try {
      final response = await _dio.post(path, data: formData);
      return response.data;
    } on DioException catch (e) {
      if (e.response != null && e.response!.data != null) {
        throw e.response!.data;
      } else {}
      rethrow;
    }
  }

  static Future putFormData(String path, FormData formData) async {
    try {
      final response = await _dio.put(path, data: formData);
      return response.data;
    } on DioException catch (e) {
      if (e.response != null && e.response!.data != null) {
        throw e.response!.data;
      } else {}
      rethrow;
    }
  }

  static Future postList(String path, List<Map<String, dynamic>> data) async {
    try {
      final response = await _dio.post(path, data: data);
      return response.data;
    } on DioException catch (e) {
      if (e.response != null && e.response!.data != null) {
        throw e.response!.data;
      } else {}
      rethrow;
    }
  }

  static Future patch(String path, Map<String, dynamic> data) async {
    try {
      final response = await _dio.patch(path, data: data);
      return response.data;
    } on DioException catch (e) {
      if (e.response != null && e.response!.data != null) {
        throw e.response!.data;
      } else {}
      rethrow;
    }
  }

  static Future delete(String path) async {
    try {
      final response = await _dio.delete(path);
      return response.data;
    } on DioException {
      rethrow;
    }
  }
}
