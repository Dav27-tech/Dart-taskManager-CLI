# Task Manager CLI

Une application en ligne de commande développée en **Dart pur** permettant de gérer des tâches.

## Fonctionnalités

- Ajouter une tâche
- Lister toutes les tâches
- Marquer une tâche comme terminée
- Supprimer une tâche
- Sauvegarder automatiquement les tâches dans un fichier JSON

---

## Technologies utilisées

- Dart
- JSON (persistance des données)
- Package `test` (tests unitaires)

---

## Structure du projet

```text
taskmanager/
│
├── bin/
│   └── main.dart
│
├── data/
│   └── tasks.json
│
├── lib/
│   ├── exceptions/
│   │   └── task_exception.dart
│   │
│   ├── models/
│   │   ├── task.dart
│   │   └── urgent_task.dart
│   │
│   └── repositories/
│       ├── repository.dart
│       └── task_repository.dart
│
├── test/
│   └── task_repository_test.dart
│
├── pubspec.yaml
└── README.md
```

---

# Installation

Assurez-vous que le SDK Dart est installé.

Vérifiez la version :

```bash
dart --version
```

Téléchargez ensuite les dépendances :

```bash
dart pub get
```

---

# Lancer l'application

Depuis la racine du projet, exécutez :

```bash
dart run bin/main.dart
```

Un menu s'affichera :

```text
========== TASK MANAGER ==========

1. Ajouter une tâche
2. Lister les tâches
3. Marquer une tâche comme terminée
4. Supprimer une tâche
5. Quitter
```

Suivez simplement les instructions affichées dans le terminal.

---

# Exécuter les tests unitaires

Pour lancer tous les tests :

```bash
dart test
```

Si tous les tests réussissent, vous obtiendrez un résultat similaire à :

```text
00:00 +5: All tests passed!
```

---

# Persistance des données

Les tâches sont enregistrées automatiquement dans :

```text
data/tasks.json
```

Les données sont rechargées au prochain lancement de l'application.

---

# Fonctionnalités couvertes par les tests

Les tests unitaires vérifient notamment :

- Ajout d'une tâche
- Recherche d'une tâche par identifiant
- Suppression d'une tâche
- Marquage d'une tâche comme terminée
- Refus d'un identifiant déjà existant

---

# Auteur

David Amani
