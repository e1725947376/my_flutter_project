import 'package:fl_voy_app/models/models.dart';
import 'package:fl_voy_app/screens/screens.dart';
import 'package:fl_voy_app/services/services.dart';
import 'package:fl_voy_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tasksService = Provider.of<TasksService>(context);

    if (tasksService.isLoading) return LoadingScreen();

    return Scaffold(
      appBar: AppBar(title: const Text('Monitor de Tareas')),
      body: ListView.builder(
          itemCount: tasksService.tasks.length,
          itemBuilder: (BuildContext context, int index) => GestureDetector(
              onTap: () {
                tasksService.selectedTask = tasksService.tasks[index].copy();
                Navigator.pushNamed(context, 'taske');
              },
              child: ProdcutCard(
                task: tasksService.tasks[index],
              ))),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          tasksService.selectedTask =
              new Task(available: false, name: 'Tarea Temporal', price: 0);
          Navigator.pushNamed(context, 'taske');
        },
      ),
    );
  }
}
