import 'package:flutter/widgets.dart';
import 'package:todo_app/api/firebase_api.dart';
import 'package:todo_app/model/todo_model.dart';

class TodosProvider extends ChangeNotifier {
  List<TodoModel> _todos = [];

  List<TodoModel> get todos =>
      _todos.where((todo) => todo.isDone == false).toList();

  List<TodoModel> get todosCompleted =>
      _todos.where((todo) => todo.isDone == true).toList();

  void setTodos(List<TodoModel> todos) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _todos = todos;
      notifyListeners();
    });
  }

  void addTodo(TodoModel todo) => FirebaseApi.createTodo(todo);

  void updateTodo(TodoModel todo, String title, String description) {
    todo.title = title;
    todo.description = description;

    FirebaseApi.updateTodo(todo);
  }

  void removeTodo(TodoModel todo) => FirebaseApi.deleteTodo(todo);

  bool toggleTodoStatus(TodoModel todo) {
    todo.isDone = !todo.isDone;

    FirebaseApi.updateTodo(todo);

    return todo.isDone;
  }
}
