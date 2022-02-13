import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/provider/todos.dart';
import 'package:todo_app/widgets/todo_form_widget.dart';

class EditTodoPage extends StatefulWidget {
  final TodoModel todo;

  const EditTodoPage({Key? key, required this.todo}) : super(key: key);

  @override
  _EditTodoPageState createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  final _formKey = GlobalKey<FormState>();

  late String title;
  late String description;

  @override
  void initState() {
    super.initState();

    this.title = widget.todo.title;
    this.description = widget.todo.description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text('Edit todo'),
      actions: [
        IconButton(
          onPressed: () => _removeTodo(context, widget.todo),
          icon: Icon(Icons.delete),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: TodoFormWidget(
          title: title,
          description: description,
          onChangedTitle: (title) => setState(() => this.title = title),
          onChangedDescription: (description) =>
              setState(() => this.description = description),
          onSavedTodo: () => _saveTodo(widget.todo),
        ),
      ),
    );
  }

  // methods
  void _removeTodo(BuildContext context, TodoModel todo) {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    provider.removeTodo(todo);

    Navigator.of(context).pop();
  }

  void _saveTodo(TodoModel todo) {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) return;

    final provider = Provider.of<TodosProvider>(context, listen: false);

    provider.updateTodo(todo, title, description);
    Navigator.pop(context);
  }
}
