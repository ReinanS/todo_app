import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/core/utils.dart';
import 'package:todo_app/model/todo_model.dart';

class FirebaseApi {
  static Future<String> createTodo(TodoModel todo) async {
    final docTodo = FirebaseFirestore.instance.collection('todo').doc();

    todo.id = docTodo.id;
    await docTodo.set(todo.toJson());

    return docTodo.id;
  }

  static Stream<List<TodoModel>> readTodos() {
    return FirebaseFirestore.instance
        .collection('todo')
        .orderBy(TodoField.createdTime, descending: true)
        .snapshots()
        .transform(Utils.transformer(TodoModel.fromJson));
  }

  static Future updateTodo(TodoModel todo) async {
    final docTodo = FirebaseFirestore.instance.collection('todo').doc(todo.id);
    await docTodo.update(todo.toJson());
  }

  static Future deleteTodo(TodoModel todo) async {
    final docTodo = FirebaseFirestore.instance.collection('todo').doc(todo.id);
    await docTodo.delete();
  }
}
