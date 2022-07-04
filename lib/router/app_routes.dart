import 'package:fl_voy_app/screens/task_screen.dart';
import 'package:flutter/material.dart';

import 'package:fl_voy_app/models/models.dart';
import 'package:fl_voy_app/screens/screens.dart';

class AppRoutes {
  static final menuOptions = <MenuOption>[
    //TODO: borrar home

    MenuOption(
        route: 'card',
        name: 'Cards - Tarjetas',
        screen: const CardScreen(),
        icon: Icons.card_giftcard),

    MenuOption(
        route: 'task',
        name: 'Monitor Tareas',
        screen: const TaskScreen(),
        icon: Icons.task_alt_outlined),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};

    for (final option in menuOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }
    return appRoutes;
  }

  // static Map<String, Widget Function(BuildContext)> route = {
  //     'home'     :(BuildContext context) => const HomeScreen(),
  //   'listview1':(BuildContext context) => Listview1Screen(),
  // 'listview2':(BuildContext context) => Listview2Screen(),
  // 'card'     :(BuildContext context) => const CardScreen(),
  // 'alert'    :(BuildContext context) => const AlertScreen()

  // };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const AlertScreen());
  }
}
