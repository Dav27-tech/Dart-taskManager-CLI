import 'dart:convert';
import 'dart:io';

import 'package:taskmanager/models/task.dart';
import 'package:taskmanager/repositories/repository.dart';
import 'package:taskmanager/exceptions/task_exception.dart';

class TaskRepository extends Repository<Task> {
  final List<Task> _tasks = [];

  final File _file = File("data/tasks.json");

  /// Charge les tâches depuis le fichier JSON
  Future<void> load() async {
    try {
      if (!await _file.exists()) {
        await _file.create(recursive: true);
        await _file.writeAsString("[]");
      }

      String content = await _file.readAsString();

      if (content.trim().isEmpty) {
        content = "[]";
      }

      List<dynamic> jsonData = jsonDecode(content);

      _tasks.clear();

      _tasks.addAll(jsonData.map((task) => Task.fromJson(task)).toList());
    } catch (e) {
      print("Erreur lors du chargement : $e");
    }
  }

  /// Sauvegarde les tâches dans le fichier JSON
  Future<void> _save() async {
    List<Map<String, dynamic>> jsonData = _tasks
        .map((task) => task.toJson())
        .toList();

    await _file.writeAsString(jsonEncode(jsonData));
  }

  @override
  void add(Task item) {
    if (findById(item.id) != null) {
      throw TaskException(
        "L'identifiant est déjà utilisé par une autre tâche.",
      );
    }

    _tasks.add(item);

    _save();
  }

  @override
  List<Task> findAll() {
    return [..._tasks];
  }

  @override
  Task? findById(int id) {
    try {
      return _tasks.firstWhere((task) => task.id == id);
    } catch (e) {
      return null;
    }
  }

  @override
  void remove(int id) {
    Task? task = findById(id);

    if (task == null) {
      throw TaskException(
        "La tâche que vous essayez de supprimer n'existe pas.",
      );
    }

    _tasks.remove(task);

    _save();
  }

  @override
  void complete(int id) {
    Task? task = findById(id);

    if (task == null) {
      throw TaskException("La tâche n'existe pas.");
    }

    task.completed = true;

    _save();
  }
}
