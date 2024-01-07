import 'package:financeiro/page_not_found.dart';
import 'package:financeiro/home_page.dart';
import 'package:financeiro/core/providers/auth/auth_provider.dart';
import 'package:financeiro/routes/route_utils.dart';
import 'package:window_location_href/window_location_href.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final AuthProvider authProvider;
  AppRouter(this.authProvider);

  /* String? redirect(BuildContext context, GoRouterState state) {
    var authStatus = authProvider.authStatus;
    
    if (authStatus == AuthStatus.unauthenticated) {
      return state.fullPath!.contains('register') ||
              state.fullPath!.contains('requestPassword') ||
              state.fullPath!.contains('resetPassword')
          ? null
          : AppPage.login.toPath;
    }

    if (authStatus == AuthStatus.authenticated) {
      return state.fullPath == AppPage.login.toPath ||
              state.fullPath == AppPage.register.toPath ||
              state.fullPath == AppPage.requestPassword.toPath ||
              state.fullPath == AppPage.resetPassword.toPath
          ? AppPage.homePage.toPath
          : null;
    }

    //return Uri.parse(href!).path != '/' ? Uri.parse(href!).path : null;
    return null;
  } */

  late final router = GoRouter(
    debugLogDiagnostics: true,
    refreshListenable: authProvider,
    //initialLocation: AppPage.login.toPath,
    initialLocation: Uri.parse(href!).path != '/'
        ? Uri.parse(href!).path
        : AppPage.homePage.toPath,
    routes: _routes,
    //redirect: redirect,
    errorBuilder: (context, state) {
      return const PageNotFound();
    },
  );

  final List<GoRoute> _routes = [
    GoRoute(
      path: AppPage.homePage.toPath,
      name: AppPage.homePage.toName,
      builder: (context, state) {
        return const HomePage();
      },
    ),
  ];
}
