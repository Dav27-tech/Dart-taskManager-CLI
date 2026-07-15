import 'package:test/test.dart';
import 'package:taskmanager/models/task.dart';
import 'package:taskmanager/repositories/task_repository.dart';

void main() {
  group("Tests du TaskRepository", () {
    test("Ajouter une tâche", () {
      final repository = TaskRepository();

      repository.add(Task(1, "Apprendre Dart", "high"));

      expect(repository.findAll().length, equals(1));
    });

    test("Rechercher une tâche par son identifiant", () {
      final repository = TaskRepository();

      repository.add(Task(1, "Apprendre Dart", "high"));

      expect(repository.findById(1), isNotNull);
    });

    test("Supprimer une tâche", () {
      final repository = TaskRepository();

      repository.add(Task(1, "Apprendre Dart", "high"));

      repository.remove(1);

      expect(repository.findAll().isEmpty, isTrue);
    });

    test("Marquer une tâche comme terminée", () {
      final repository = TaskRepository();

      repository.add(Task(1, "Apprendre Dart", "high"));

      repository.complete(1);

      expect(repository.findById(1)?.completed, isTrue);
    });

    test("Refuser deux tâches avec le même identifiant", () {
      final repository = TaskRepository();

      repository.add(Task(1, "Première tâche", "low"));

      expect(
        () => repository.add(Task(1, "Deuxième tâche", "high")),
        throwsException,
      );
    });
  });
}
