import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTasksScreen extends StatefulWidget {
  @override
  _AddTasksScreenState createState() => _AddTasksScreenState();
}

class _AddTasksScreenState extends State<AddTasksScreen> {
  final _formKey = GlobalKey<FormState>();
  String _title = "";
  late String _priority;
  DateTime _date = DateTime.now();
  TextEditingController _dateController = TextEditingController();
  final DateFormat _dateFormatter = DateFormat('MMM dd, yyyy');
  final List<String> _priorityList = [
    'Low',
    'Medium',
    'High',
  ];

// methods to create calendar

  @override
  void initState() {
    super.initState();
    _dateController.text = _dateFormatter.format(_date);
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  _handleDateTimePicker() async {
    final DateTime dateTime = (await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100)))!;
    if (dateTime != null && dateTime != _date) {
      setState(() {
        _date = dateTime;
      });
      _dateController.text = _dateFormatter.format(_date);
      // _dateController.text = _date.toString();
    }
  }

  // method to create submit button function
  _save() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print("$_title, $_date, $_priority");
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Tasks",
          style: TextStyle(
            color: Colors.white,
            fontSize: 36.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 80.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // GestureDetector(
                //   onTap: () {
                //     Navigator.pop(context);
                //   },
                //   child: Icon(
                //     Icons.arrow_back,
                //     color: Theme.of(context).primaryColorDark,
                //   ),
                // ),
                // SizedBox(height: 10.0),
                // Center(
                //   child: Text(
                //     "Add Tasks",
                //     style: TextStyle(
                //       color: Colors.purple,
                //       fontSize: 36.0,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                // ),
                // SizedBox(height: 10),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: TextFormField(
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Theme.of(context).primaryColor),
                          decoration: InputDecoration(
                            hoverColor: Colors.white,
                            labelText: "Title",
                            labelStyle:
                                TextStyle(fontSize: 18.0, color: Colors.grey),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 5,
                                  color: Colors.red,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          validator: (input) => input!.trim().isEmpty
                              ? "You must provide title.........."
                              : null,
                          onSaved: (input) => _title = input!,
                          initialValue: _title,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: TextFormField(
                          readOnly: true,
                          controller: _dateController,
                          onTap: _handleDateTimePicker,
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Theme.of(context).primaryColor),
                          decoration: InputDecoration(
                            labelText: "Date & Time",
                            labelStyle:
                                TextStyle(fontSize: 18.0, color: Colors.grey),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 2,
                                  color: Colors.white,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          validator: (input) => input!.trim().isEmpty
                              ? "You must provide date.........."
                              : null,
                          onSaved: (input) => _title = input!,
                          initialValue: null,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: DropdownButtonFormField(
                          isDense: true,
                          icon: Icon(Icons.arrow_drop_down_circle_sharp),
                          iconSize: 16.0,
                          items: _priorityList.map((String _priority) {
                            return DropdownMenuItem(
                              value: _priority,
                              child: Text(
                                _priority,
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor),
                              ),
                            );
                          }).toList(),
                          decoration: InputDecoration(
                            hoverColor: Colors.white,
                            labelText: "Priority",
                            labelStyle:
                                TextStyle(fontSize: 18.0, color: Colors.grey),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 2,
                                  color: Colors.white,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          // ignore: unnecessary_null_comparison
                          validator: (input) => _priority == null
                              ? 'Please select a priority level'
                              : null,
                          onChanged: (value) {
                            setState(() {
                              _priority = value.toString();
                            });
                          },
                          // value: _priority,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RaisedButton(
                              color: Colors.green,
                              onPressed: () {
                                print("Added Tasks");
                                _save();
                              },
                              child: Text(
                                "Save",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 28.0),
                              ),
                            ),
                            RaisedButton(
                              onPressed: () {
                                print("Updated Tasks");
                              },
                              child: Text(
                                "Update",
                                style: TextStyle(
                                    color: Colors.purple, fontSize: 28.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
