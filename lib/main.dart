import 'dart:ui';

import 'package:financeiro/core/api/directus_api.dart';
import 'package:financeiro/core/providers/auth/auth_provider.dart';
import 'package:financeiro/core/providers/entities/crud_stack_provider.dart';
import 'package:financeiro/core/providers/entities/generic_items_provider.dart';
import 'package:financeiro/core/providers/navigation/navigation_provider.dart';
import 'package:financeiro/routes/routes.dart';
import 'package:financeiro/core/services/local_storage.dart';
import 'package:financeiro/core/services/snack_service.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/internationalization.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterFlowTheme.initialize();
  await LocalStorage.configurePrefs();
  await dotenv.load(fileName: '.env');
  DirectusAPI.configureDio();
  timeago.setLocaleMessages('pt_br', timeago.PtBrShortMessages());
  setPathUrlStrategy();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(
          create: (context) => NavigationProvider(
            context.read<AuthProvider>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => GenericItemsProvider(
            navigationProvider: context.read<NavigationProvider>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => CrudStackProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  // ignore: library_private_types_in_public_api
  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  @override
  void initState() {
    super.initState();
  }

  void setLocale(String language) {
    setState(() => _locale = createLocale(language));
  }

  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final goRouter = AppRouter(
        context.read<AuthProvider>(),
      ).router;

      return MaterialApp.router(
        routerDelegate: goRouter.routerDelegate,
        routeInformationParser: goRouter.routeInformationParser,
        routeInformationProvider: goRouter.routeInformationProvider,
        debugShowCheckedModeBanner: false,
        title: 'Financeiro',
        localizationsDelegates: const [
          FFLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: _locale,
        supportedLocales: const [Locale('en', '')],
        theme: ThemeData(brightness: Brightness.light),
        darkTheme: ThemeData(brightness: Brightness.dark),
        themeMode: _themeMode,
        scaffoldMessengerKey: SnackService.messengerKey,
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
            PointerDeviceKind.stylus,
            PointerDeviceKind.unknown
          },
        ),
      );
    });
  }
}
