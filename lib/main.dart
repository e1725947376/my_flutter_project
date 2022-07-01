import 'package:fl_voy_app/router/app_routes.dart';
import 'package:fl_voy_app/services/tasks_service.dart';
import 'package:fl_voy_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:fl_voy_app/screens/screens.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => TasksService())],
        child: MyApp());
  }
}

class MyApp extends StatelessWidget {
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
