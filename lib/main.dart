import 'dart:io';

import 'package:flutter/material.dart';
import 'package:optionsgenieui/common/app_data.dart';
import 'package:optionsgenieui/common/https_override.dart';
import 'package:optionsgenieui/common/ui_constants.dart';
import 'package:optionsgenieui/common/ui_state.dart';
import 'package:optionsgenieui/constants.dart';
import 'package:optionsgenieui/screens/home/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

//flutter build web
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<UiState>(create: (_) => UiState()),
    ChangeNotifierProvider<AppData>(create: (_) => AppData()),
  ], child: OptionsGenie()));
}

Future init() async {
  HttpOverrides.global = DevHttpOverrides();
  //await SettingsController.instance.load();
}

class OptionsGenie extends StatelessWidget {
  OptionsGenie({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        title: 'Options Genie',
        theme: ThemeData(
            useMaterial3: true,
            colorSchemeSeed: themeColor,
            brightness: Brightness.dark,
            inputDecorationTheme: kTextFieldDecorationTheme(themeColor),
            textTheme: GoogleFonts.openSansTextTheme(
                ThemeData(brightness: Brightness.dark).textTheme)),
        debugShowCheckedModeBanner: false,
        routerConfig: _router);
  }

  final GoRouter _router = GoRouter(
    initialLocation: isLoggedIn ? '/$HOME_SCREEN' : '/',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
          name: WELCOME_SCREEN,
          path: '/',
          builder: (BuildContext context, GoRouterState state) =>
              const HomeScreen(),
          routes: [
            GoRoute(
                name: SIGN_IN_SCREEN,
                path: SIGN_IN_SCREEN,
                builder: (BuildContext context, GoRouterState state) =>
                    const HomeScreen()),
          ]),
      GoRoute(
        name: HOME_SCREEN,
        path: '/$HOME_SCREEN',
        builder: (BuildContext context, GoRouterState state) =>
            const HomeScreen(),
        routes: [
          GoRoute(
              name: SETTINGS_SCREEN,
              path: SETTINGS_SCREEN,
              builder: (BuildContext context, GoRouterState state) =>
                  const HomeScreen()),
          GoRoute(
              name: AUTH_PROFILE_SCREEN,
              path: AUTH_PROFILE_SCREEN,
              builder: (BuildContext context, GoRouterState state) =>
                  const HomeScreen()),
        ],
      ),
    ],
  );
}

bool get isLoggedIn {
  return true;
}
