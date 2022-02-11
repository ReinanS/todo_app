class TodoField {
  static const createdTime = 'createdTime';
}

class TodoModel {
  DateTime createdTime;
  String title;
  String? id;
  String description;
  bool isDone;

  TodoModel({
    required this.createdTime,
    required this.title,
    this.description = '',
    this.isDone = false,
  });
}
