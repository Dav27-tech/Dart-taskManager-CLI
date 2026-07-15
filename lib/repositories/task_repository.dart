import 'package:taskmanager/models/task.dart';
import 'package:taskmanager/repositories/repository.dart';

class TaskRepository extends Repository<Task> {
  final List<Task> _tasks = [];

  @override
  void add(Task item) {
    if (findById(item.id) != null) {
      throw Exception("L'identifiant est déjà utilisé par une autre tâche");
    }
    _tasks.add(item);
  }

  @override
  List<Task> findAll() {
    return [..._tasks];
  }

  @override
  Task? findById(int id) {
    try {
      return (_tasks.firstWhere((task) => task.id == id));
    } catch (e) {
      return null;
    }
  }

  @override
  void remove(int id) {
    Task? task = findById(id);

    if (task == null) {
      throw Exception("La tache que vous essayer de supprimer n'existe pas");
    }

    _tasks.remove(task);
  }
}
