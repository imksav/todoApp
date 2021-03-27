import 'package:flutter/foundation.dart';
class TaskModel {
  int id;
  String title;
  DateTime dateTime;
  String priority;
  int status;
  TaskModel(
      {required this.title,
      required this.dateTime,
      required this.priority,
      required this.status});
  TaskModel.withId(
      {required this.id,
      required this.dateTime,
      required this.priority,
      required this.status, title});
  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    if(id!=null){
    map['id'] = id;
    }
    map['title'] = title;
    map['dateTime'] = dateTime.toIso8601String();
    map['priority'] = priority;
    map['status'] = status;
    return map;
  }
  Factory TaskModel.fromMap(Map<String, dynamic> map){
    return TaskModel.withId(id: map['id'], title: map['title'], dateTime: DateTime.parse(map['dateTime']), priority: map['priority'], status: map['status']);
  }
}
