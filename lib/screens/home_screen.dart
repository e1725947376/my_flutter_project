import 'package:fl_voy_app/services/auth_services.dart';
import 'package:flutter/material.dart';

import 'package:fl_voy_app/theme/app_theme.dart';
import 'package:fl_voy_app/router/app_routes.dart';
import 'package:provider/provider.dart';

import '../services/services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
            title: const Text('Componentes en Flutter'),
            leading: IconButton(
              icon: const Icon(Icons.login_outlined),
              onPressed: () {
                authService.logout();
                Navigator.pushReplacementNamed(context, 'login');
              },
            )),
        body: ListView.separated(
            itemBuilder: (context, index) => ListTile(
                  leading: Icon(AppRoutes.menuOptions[index].icon,
                      color: Colors.indigo),
                  title: Text(AppRoutes.menuOptions[index].name),
                  onTap: () {
                    //   final route = MaterialPageRoute(
                    //   builder: (context) => const CardScreen());
                    //    Navigator.push(context, route);
                    Navigator.pushNamed(
                        context, AppRoutes.menuOptions[index].route);
                  },
                ),
            separatorBuilder: (_, __) => const Divider(),
            itemCount: AppRoutes.menuOptions.length));
  }
}
