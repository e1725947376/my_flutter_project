import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import '../models/models.dart';
import 'package:http/http.dart' as http;

class TasksService extends ChangeNotifier {
  final String _baseUrl = 'fl-app-voy-default-rtdb.firebaseio.com';
  final List<Task> tasks = [];
  late Task selectedTask;
  File? newPictureFile;

  bool isLoading = true;
  bool isSaving = false;

  TasksService() {
    this.loadTasks();
  }

  Future<List<Task>> loadTasks() async {
    this.isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'tasks.json');
    final resp = await http.get(url);

    final Map<String, dynamic> tasksMap = json.decode(resp.body);
    tasksMap.forEach((key, value) {
      final tempTask = Task.fromMap(value);
      tempTask.id = key;
      this.tasks.add(tempTask);
    });

    this.isLoading = false;
    notifyListeners();
    return this.tasks;
  }

  Future saveOrCreateTask(Task task) async {
    isSaving = true;
    notifyListeners();

    if (task.id == null) {
      //es necesario crear
      await this.createTask(task);
    } else {
      //actualizar
      await this.updateTask(task);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> updateTask(Task task) async {
    final url = Uri.https(_baseUrl, 'tasks/${task.id}.json');
    final resp = await http.put(url, body: task.toJson());
    final decodeData = resp.body;

    print(decodeData);
    //Actualizar el listado de productos
    final index = this.tasks.indexWhere((element) => element.id == task.id);
    this.tasks[index] = task;
    return task.id!;
  }

  Future<String> createTask(Task task) async {
    final url = Uri.https(_baseUrl, 'tasks.json');
    final resp = await http.post(url, body: task.toJson());
    final decodeData = json.decode(resp.body);
    task.id = decodeData['name'];
    this.tasks.add(task);

    return task.id!;
    //Actualizar el listado de productos
  }

  void updateSelectedTaskImage(String path) {
    this.selectedTask.picture = path;
    this.newPictureFile = File.fromUri(Uri(path: path));

    notifyListeners();
  }

  Future<String?> uploadImage() async {
    if (this.newPictureFile == null) return null;

    this.isSaving = true;
    notifyListeners();

    final url = Uri.parse(
        'https://api.cloudinary.com/v1_1/flappvoy/image/upload?upload_preset=qm9toqmz');
    final imageUploadRequest = http.MultipartRequest('POST', url);
    final file =
        await http.MultipartFile.fromPath('file', newPictureFile!.path);

    imageUploadRequest.files.add(file);

    final streamReponse = await imageUploadRequest.send();
    final resp = await http.Response.fromStream(streamReponse);

    if (resp.statusCode != 200 && resp.statusCode != 201) {
      return null;
    }

    this.newPictureFile = null;
    final decodeData = json.decode(resp.body);
    return decodeData['secure_url'];
  }
}
