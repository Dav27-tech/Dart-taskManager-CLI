import 'package:taskmanager/models/task.dart';
import 'package:taskmanager/models/urgent_task.dart';
import 'package:taskmanager/repositories/task_repository.dart';

void main() {
  final repository = TaskRepository();

  final task1 = Task(1, "Apprendre Dart", "high");

  final task2 = UrgentTask(2, "Terminer le projet", "high");

  repository.add(task1);
  repository.add(task2);

  for (var task in repository.findAll()) {
    print(task);
    print("----------------");
  }

  final result = repository.findById(1);
  print(result);

  repository.remove(100);
  print(repository.findAll());
}
