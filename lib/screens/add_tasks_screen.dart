import 'package:flutter/material.dart';
import 'package:todoapps/widgets/input_widget.dart';

class AddTasksScreen extends StatefulWidget {
  @override
  _AddTasksScreenState createState() => _AddTasksScreenState();
}

class _AddTasksScreenState extends State<AddTasksScreen> {
  final _formKey = GlobalKey<FormState>();
  String _title = "";
  late String _priority;
  DateTime _date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                "Add Tasks",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          TextFormField(
                            style: TextStyle(fontSize: 18.0),
                            decoration: InputDecoration(
                              hoverColor: Colors.white,
                              labelText: "Title",
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 2,
                                    color: Colors.white,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(29.0),
                              ),
                            ),
                            validator: (input) => input!.trim().isEmpty
                                ? "Please add title to the task"
                                : null,
                            onSaved: (input) => _title = input!,
                            initialValue: _title,
                          ),
                          TextFormField(
                            style: TextStyle(fontSize: 18.0),
                            decoration: InputDecoration(
                              hoverColor: Colors.white,
                              labelText: "Date",
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 2,
                                    color: Colors.white,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(29.0),
                              ),
                            ),
                          ),
                          TextFormField(
                            style: TextStyle(fontSize: 18.0),
                            decoration: InputDecoration(
                              hoverColor: Colors.white,
                              labelText: "Priority",
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 2,
                                    color: Colors.white,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(29.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
