import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/utils.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/pages/edit_todo_page.dart';
import 'package:todo_app/provider/todos.dart';

class TodoWidget extends StatelessWidget {
  final TodoModel todo;

  TodoWidget({
    required this.todo,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildSlidableCard(context);
  }

  Widget _buildSlidableCard(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Slidable(
        startActionPane: ActionPane(
          motion: ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) => _editTodo(context, todo),
              backgroundColor: Colors.green,
              label: 'Edit',
              icon: Icons.edit,
            ),
          ],
        ),
        endActionPane: ActionPane(
          motion: ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) => _deleteTodo(context, todo),
              backgroundColor: Colors.red,
              label: 'Delete',
              icon: Icons.delete,
            ),
          ],
        ),
        child: _buildTodo(context),
      ),
    );
  }

  Widget _buildTodo(BuildContext context) {
    return GestureDetector(
      onTap: () => _editTodo(context, todo),
      child: Container(
        color: Theme.of(context).cardColor,
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Checkbox(
              activeColor: Theme.of(context).primaryColor,
              checkColor: Colors.white,
              value: todo.isDone,
              onChanged: (_) => _toggleTodoStatus(context, todo),
            ),
            const SizedBox(width: 20),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  todo.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    // color: Theme.of(context).primaryColor,
                    fontSize: 22,
                  ),
                ),
                if (todo.description.isNotEmpty)
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    child: Text(
                      todo.description,
                      style: TextStyle(fontSize: 20, height: 1.5),
                    ),
                  ),
              ],
            )),
          ],
        ),
      ),
    );
  }

  void _deleteTodo(BuildContext context, TodoModel todo) {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    provider.removeTodo(todo);

    Utils.showSnackBar(context, 'Deleted the task');
  }

  void _editTodo(BuildContext context, TodoModel todo) =>
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => EditTodoPage(todo: todo),
        ),
      );

  void _toggleTodoStatus(BuildContext context, TodoModel todo) {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    final isDone = provider.toggleTodoStatus(todo);

    Utils.showSnackBar(
        context, isDone ? 'Task completed' : 'Task marked incomplete');
  }
}
