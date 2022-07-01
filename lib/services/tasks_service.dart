import 'package:flutter/material.dart';
import '../models/models.dart';

class TasksService extends ChangeNotifier {
  final String _baseUrl = 'fl-app-voy-default-rtdb.firebaseio.com';
  final List<Task> tasks = [];
}
