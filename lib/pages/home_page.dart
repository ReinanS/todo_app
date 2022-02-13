import 'package:flutter/material.dart';
import 'package:todo_app/core/constanst.dart';
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
      floatingActionButton: _customFloatingActionButtom(),
      body: tabs[_selectedIndex],
      bottomNavigationBar: _customNavigationBar(),
    );
  }

  FloatingActionButton _customFloatingActionButtom() {
    return FloatingActionButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Theme.of(context).primaryColor,
      onPressed: () => showDialog(
        context: context,
        builder: (context) => AddTodoDialogWidget(),
        barrierDismissible: false,
      ),
      child: Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }

  BottomNavigationBar _customNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).primaryColor,
      unselectedItemColor: Colors.white.withOpacity(0.7),
      selectedItemColor: Colors.white,
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
}
