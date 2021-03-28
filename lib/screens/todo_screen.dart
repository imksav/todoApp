import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todoapps/database/database_helper.dart';
import 'package:todoapps/models/task_models.dart';
import 'package:todoapps/screens/add_tasks_screen.dart';

class ToDoListScreen extends StatefulWidget {
  @override
  _ToDoListScreenState createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {
  final DateFormat _dateFormatter = DateFormat('MMM dd, yyyy');

  late Future<List<Task>> _taskList;
  @override
  void initState() {
    super.initState();
    _updateTaskList();
  }

  _updateTaskList() {
    setState(() {
      _taskList = DatabaseHelper.instance.getTaskList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AddTasksScreen(
                updateTaskList: _updateTaskList(),
              ),
            ),
          );
        },
      ),
      appBar: AppBar(
        title: Text("Flutter To Do App"),
        centerTitle: false,
        backgroundColor: Colors.purpleAccent,
      ),
      body: FutureBuilder(
        future: _taskList,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final int completedTaskCount = snapshot.data
              .where((Task task) => task.status == 1)
              .toList()
              .length;
          return ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 50.0),
            itemCount: 1 + snapshot.data.toString().length,
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
                      "$completedTaskCount of $snapshot.data.length completed",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                );
              }
              return _createTasks(snapshot.data[index - 1]);
            },
          );
        },
      ),
    );
  }

  Widget _createTasks(Task task) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListTile(
          title: Text(task.title),
          subtitle:
              Text('${_dateFormatter.format(task.date)}+ ${task.priority}'),
          trailing: Checkbox(
            onChanged: (value) {
              task.status == value ? 1 : 0;
              DatabaseHelper.instance.updateTask(task);
              _updateTaskList();
              print(value);
            },
            value: true,
            activeColor: Colors.green,
          ),
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => AddTasksScreen(
                        updateTaskList: _updateTaskList(),
                        task: task,
                      ))),
        ),
      ),
    );
  }
}
