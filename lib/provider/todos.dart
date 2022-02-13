import 'package:flutter/widgets.dart';
import 'package:todo_app/model/todo_model.dart';

class TodosProvider extends ChangeNotifier {
  List<TodoModel> _todos = [
    TodoModel(
      createdTime: DateTime.now(),
      title: 'Musculação 🏋️',
      description: '- Posterior de coxa\n- Agachamento invertido',
    ),
    TodoModel(
      createdTime: DateTime.now(),
      title: 'Walk the Dog 🐕',
    ),
  ];

  List<TodoModel> get todos =>
      _todos.where((todo) => todo.isDone == false).toList();

  List<TodoModel> get todosCompleted =>
      _todos.where((todo) => todo.isDone == true).toList();

  void addTodo(TodoModel todo) {
    _todos.add(todo);

    notifyListeners();
  }

  void removeTodo(TodoModel todo) {
    _todos.remove(todo);

    notifyListeners();
  }

  void updateTodo(TodoModel todo, String title, String description) {
    todo.title = title;
    todo.description = description;

    notifyListeners();
  }

  bool toggleTodoStatus(TodoModel todo) {
    todo.isDone = !todo.isDone;

    notifyListeners();

    return todo.isDone;
  }
}
