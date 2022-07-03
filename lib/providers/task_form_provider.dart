import 'package:flutter/material.dart';

import '../models/models.dart';

class TaskFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  Task task;
  TaskFormProvider(this.task);

  updateAvailability(bool value) {
    this.task.available = value;
    notifyListeners();
  }

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
