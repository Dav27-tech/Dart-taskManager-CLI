class Task {
  final int id;
  String _title;
  late String _priority;
  bool _completed;

  Task(this.id, this._title, String priority) : _completed = false {
    this.priority = priority;
  }

  // Getters
  String get title => _title;
  String get priority => _priority;
  bool get completed => _completed;

  // Setters
  set title(String value) => _title = value;
  set priority(String value) {
    if (value != 'low' && value != 'medium' && value != 'high') {
      throw Exception("La priorité doit être 'low', 'medium' ou 'high'.");
    }
    _priority = value;
  }

  set completed(bool value) => _completed = value;

  // Afficher les taches
  @override
  String toString() {
    return '''
Id        : $id
Titre     : $_title
Priorité  : $_priority
Terminée  : $_completed
''';
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "priority": priority,
      "completed": completed,
    };
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    Task task = Task(json["id"], json["title"], json["priority"]);

    task.completed = json["completed"];

    return task;
  }
}
