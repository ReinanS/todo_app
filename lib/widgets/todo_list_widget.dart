import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/todos.dart';
import 'package:todo_app/widgets/todo_widget.dart';

class TodoListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todos;

    return todos.isEmpty
        ? Center(
            child: Text(
              'No todos',
              style: TextStyle(fontSize: 20),
            ),
          )
        : ListView.separated(
            separatorBuilder: (context, index) => Container(height: 10),
            itemCount: todos.length,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            itemBuilder: (context, index) => TodoWidget(todo: todos[index]),
          );
  }
}
