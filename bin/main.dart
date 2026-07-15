import 'dart:io';

import 'package:taskmanager/models/task.dart';
import 'package:taskmanager/models/urgent_task.dart';
import 'package:taskmanager/repositories/task_repository.dart';

void main() {
  final repository = TaskRepository();

  while (true) {
    print("\n========== TASK MANAGER ==========");
    print("1. Ajouter une tâche");
    print("2. Lister les tâches");
    print("3. Marquer une tâche comme terminée");
    print("4. Supprimer une tâche");
    print("5. Quitter");

    stdout.write("\nVotre choix : ");
    String? choice = stdin.readLineSync();
    print('----------------------------');

    switch (choice) {
      case "1":
        addTask(repository);
        break;

      case "2":
        listTasks(repository);
        break;

      case "3":
        completeTask(repository);
        break;

      case "4":
        deleteTask(repository);
        break;

      case "5":
        print("Au revoir !");
        return;

      default:
        print("Choix invalide.");
    }
  }
}

void addTask(TaskRepository repository) {
  stdout.write("Id : ");
  int id = int.parse(stdin.readLineSync()!);

  stdout.write("Titre : ");
  String title = stdin.readLineSync()!;

  stdout.write("Priorité (low/medium/high) : ");
  String priority = stdin.readLineSync()!;

  stdout.write("Urgente ? (o/n) : ");
  String urgent = stdin.readLineSync()!;

  try {
    if (urgent.toLowerCase() == "o") {
      repository.add(UrgentTask(id, title, priority));
    } else {
      repository.add(Task(id, title, priority));
    }

    print("Tâche ajoutée.");
  } catch (e) {
    print(e);
  }
}

void listTasks(TaskRepository repository) {
  var tasks = repository.findAll();

  if (tasks.isEmpty) {
    print("Aucune tâche.");
    return;
  }

  for (var task in tasks) {
    print(task);
  }
}

void completeTask(TaskRepository repository) {
  stdout.write("Id : ");

  int id = int.parse(stdin.readLineSync()!);

  try {
    repository.complete(id);

    print("Tâche terminée.");
  } catch (e) {
    print(e);
  }
}

void deleteTask(TaskRepository repository) {
  stdout.write("Id : ");

  int id = int.parse(stdin.readLineSync()!);

  try {
    repository.remove(id);

    print("Tâche supprimée.");
  } catch (e) {
    print(e);
  }
}
