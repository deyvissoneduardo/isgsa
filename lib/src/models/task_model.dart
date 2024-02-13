class TaskModel {
  final int id;
  final String description;
  final String title;
  final DateTime date;
  final bool checked;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.checked,
  });

  factory TaskModel.loadFromDB(Map<String, dynamic> task) {
    return TaskModel(
      id: task['id'],
      title: task['title'],
      description: task['description'],
      date: DateTime.parse(task['date']),
      checked: task['checked'] == 1,
    );
  }

  TaskModel copyWith({
    int? id,
    String? description,
    String? title,
    DateTime? date,
    bool? checked,
  }) {
    return TaskModel(
      id: id ?? this.id,
      description: description ?? this.description,
      title: title ?? this.title,
      date: date ?? this.date,
      checked: checked ?? this.checked,
    );
  }
}
