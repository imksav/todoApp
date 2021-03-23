import 'package:flutter/material.dart';
import 'package:todoapps/screens/add_tasks_screen.dart';
import 'package:todoapps/screens/todo_screen.dart';

void main() => runApp(ToDoApp());

class ToDoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      title: "To Do",
      debugShowCheckedModeBanner: false,
      home: ToDoListScreen(),
      // home: AddTasksScreen(),
    );
  }
}
