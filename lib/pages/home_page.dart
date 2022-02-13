import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/api/firebase_api.dart';
import 'package:todo_app/core/constanst.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/provider/todos.dart';
import 'package:todo_app/widgets/add_todo_dialog_widget.dart';
import 'package:todo_app/widgets/completed_list_widget.dart';
import 'package:todo_app/widgets/todo_list_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final tabs = [
    TodoListWidget(),
    CompletedLstWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Constants.kAppName)),
      floatingActionButton: _buildFloatingActionButtom(),
      body: _buildBody(),
      bottomNavigationBar: _buildNavigationBar(),
    );
  }

  Widget _buildBody() {
    return StreamBuilder<List<TodoModel>>(
        stream: FirebaseApi.readTodos(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());

            default:
              if (snapshot.hasError)
                return _buildText('Something Went Wrong Try Later');

              final todos = snapshot.data;

              final provider = Provider.of<TodosProvider>(context);
              provider.setTodos(todos!);

              return tabs[_selectedIndex];
          }
        });
  }

  FloatingActionButton _buildFloatingActionButtom() {
    return FloatingActionButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Theme.of(context).splashColor,
      onPressed: () => showDialog(
        context: context,
        builder: (context) => AddTodoDialogWidget(),
        barrierDismissible: false,
      ),
      child: Icon(
        Icons.add,
        color: Theme.of(context).primaryColor,
      ),
    );
  }

  BottomNavigationBar _buildNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).splashColor,
      unselectedItemColor: Theme.of(context).bottomAppBarColor,
      selectedItemColor: Theme.of(context).primaryColor,
      currentIndex: _selectedIndex,
      onTap: (index) => setState(() {
        _selectedIndex = index;
      }),
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.fact_check_outlined),
          label: 'Todo',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.done, size: 28),
          label: 'Completed',
        )
      ],
    );
  }

  Widget _buildText(String text) {
    return Center(
      child: Text(text, style: TextStyle(fontSize: 24, color: Colors.white)),
    );
  }
}
