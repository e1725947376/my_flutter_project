import 'package:fl_voy_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Monitor de Tareas')),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) =>
              const ProdcutCard()),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
