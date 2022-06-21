import 'package:flutter/material.dart';

import 'package:fl_voy_app/screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Voy',
      initialRoute: 'login',
      routes: {
        'login': (_) => const LoginScreen(),
        'home':(_) => const HomeScreen()
      },
    );
  }
}
