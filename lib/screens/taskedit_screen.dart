import 'package:fl_voy_app/providers/task_form_provider.dart';
import 'package:fl_voy_app/services/services.dart';
import 'package:fl_voy_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:fl_voy_app/ui/input_decorations.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

class TaskeditScreen extends StatelessWidget {
  const TaskeditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final taskService = Provider.of<TasksService>(context);

    return ChangeNotifierProvider(
        create: (_) => TaskFormProvider(taskService.selectedTask),
        child: _TaskScreenBody(taskService: taskService));
  }
}

class _TaskScreenBody extends StatelessWidget {
  const _TaskScreenBody({
    Key? key,
    required this.taskService,
  }) : super(key: key);

  final TasksService taskService;

  @override
  Widget build(BuildContext context) {
    final taskForm = Provider.of<TaskFormProvider>(context);

    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  ProductImage(url: taskService.selectedTask.picture),
                  Positioned(
                      top: 60,
                      left: 20,
                      child: IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const Icon(Icons.arrow_back_ios_new,
                              size: 40, color: Colors.white))),
                  Positioned(
                      top: 60,
                      right: 20,
                      child: IconButton(
                          onPressed: () async {
                            final picker = new ImagePicker();
                            final PickedFile? pickedFile =
                                await picker.getImage(
                                    source: ImageSource.camera,
                                    imageQuality: 100);
                            if (pickedFile == null) {
                              print('no seleccionó nada');
                              return;
                            }
                            print('tenemos imagen${pickedFile.path}');
                            taskService
                                .updateSelectedTaskImage(pickedFile.path);
                          },
                          icon: const Icon(Icons.camera_alt,
                              size: 40, color: Colors.white)))
                ],
              ),
              _ProductForm(),
              SizedBox(height: 10)
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
            child: taskService.isSaving
                ? CircularProgressIndicator(color: Colors.white)
                : Icon(Icons.save_outlined),
            onPressed: taskService.isSaving
                ? null
                : () async {
                    if (!taskForm.isValidForm()) return;
                    final String? imageUrl = await taskService.uploadImage();
                    if (imageUrl != null) taskForm.task.picture = imageUrl;
                    await taskService.saveOrCreateTask(taskForm.task);
                  }));
  }
}

class _ProductForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final taskForm = Provider.of<TaskFormProvider>(context);
    final task = taskForm.task;

    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            decoration: _buildBoxDecoration(),
            child: Form(
                key: taskForm.formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(children: [
                  SizedBox(height: 10),
                  TextFormField(
                    initialValue: task.name,
                    onChanged: (value) => task.name = value,
                    validator: (value) {
                      if (value == null || value.length < 1)
                        return 'El nombre es obligatorio';
                    },
                    decoration: InputDecorations.authInputDecoration(
                        hintText: 'Nombre del Producto', labelText: 'Nombre:'),
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    initialValue: '${task.price}',
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^(\d+)?\.?\d{0,2}'))
                    ],
                    onChanged: (value) {
                      if (double.tryParse(value) == null) {
                        task.price = 0;
                      } else {
                        task.price = double.parse(value);
                      }
                    },
                    decoration: InputDecorations.authInputDecoration(
                        hintText: '\$150', labelText: 'Precio:'),
                  ),
                  SizedBox(height: 30),
                  SwitchListTile.adaptive(
                      value: task.available,
                      title: Text('Disponible'),
                      activeColor: Colors.deepPurple,
                      onChanged: taskForm.updateAvailability),
                  SizedBox(height: 30)
                ]))));
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                offset: Offset(0, 5),
                blurRadius: 5)
          ]);
}
