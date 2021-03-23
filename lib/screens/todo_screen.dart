import 'package:flutter/material.dart';
import 'package:todoapps/screens/add_tasks_screen.dart';

class ToDoListScreen extends StatefulWidget {
  @override
  _ToDoListScreenState createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => AddTasksScreen()));
          AddTasksScreen();
        },
      ),
      appBar: AppBar(
        title: Text("Flutter To Do App"),
        centerTitle: false,
        backgroundColor: Colors.purpleAccent,
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 50.0),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "My Tasks",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "1 of 10 completed",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            );
          }
          return _createTasks(index);
        },
      ),
    );
  }

  Widget _createTasks(int index) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListTile(
          title: Text("Task title"),
          subtitle: Text("Date: YYYY-MM-DD, Priority"),
          trailing: Checkbox(
            onChanged: (value) {
              print(value);
            },
            value: true,
            activeColor: Colors.green,
          ),
        ),
      ),
    );
  }
}
