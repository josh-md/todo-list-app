enum TaskStatus { backlog , todo, doing, done}

extension TaskStatusExtension on TaskStatus {
  String get name {
    switch (this) {
      case TaskStatus.backlog:
        return 'Backlog';
      case TaskStatus.todo:
        return 'To-Do';
      case TaskStatus.doing:
        return 'Doing';
      case TaskStatus.done:
        return 'Done';
    }
  }
}

class Task {
  String id;
  String name;
  String description;
  String topic;
  String notes;
  TaskStatus status;

  Task({
    required this.id,
    required this.name,
    required this.description,
    required this.topic,
    required this.notes,
    required this.status,
  });
}