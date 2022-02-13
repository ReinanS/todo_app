class TodoField {
  static const createdTime = 'createdTime';
}

class TodoModel {
  String? id;
  String title;
  String description;
  DateTime createdTime;

  bool isDone;

  TodoModel({
    this.id,
    required this.title,
    this.description = '',
    required this.createdTime,
    this.isDone = false,
  });
}
