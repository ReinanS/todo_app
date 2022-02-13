import 'package:todo_app/core/utils.dart';

class TodoField {
  static const createdTime = 'createdTime';
}

class TodoModel {
  String? id;
  String title;
  String description;
  DateTime? createdTime;
  bool isDone;

  TodoModel({
    this.id,
    required this.title,
    this.description = '',
    required this.createdTime,
    this.isDone = false,
  });

  static TodoModel fromJson(Map<String, dynamic> json) => TodoModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        createdTime: Utils.toDateTime(json['createdTime']),
        isDone: json['isDone'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'createdTime': Utils.fromDateTimeToJson(createdTime),
        'isDone': isDone,
      };
}
