import 'package:taskmanager/models/task.dart';

class UrgentTask extends Task {
  UrgentTask(int id, String title, String priority)
    : super(id, title, priority);

  @override
  String toString() {
    return '''
${super.toString()}
urgent : Oui
''';
  }
}
