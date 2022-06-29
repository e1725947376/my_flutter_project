import 'package:fl_voy_app/router/app_routes.dart';
import 'package:fl_voy_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'package:fl_voy_app/screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'App Voy',
        initialRoute: AppRoutes.initialRoute,
        routes: AppRoutes.getAppRoutes(),
        onGenerateRoute: AppRoutes.onGenerateRoute,
        theme: ThemeData.light().copyWith(
            scaffoldBackgroundColor: Colors.grey[300],
            appBarTheme: const AppBarTheme(color: Colors.deepPurple),
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Colors.deepPurple,
            )));

    //initialRoute: 'login',
    //routes: {
    //  'login': (_) => const LoginScreen(),
    //  'home':(_) => const HomeScreen()
    //},
  }
}
