

import 'package:objectbox/objectbox.dart';

@Entity()
class ToDoRecord {
  int id = 0;
  String title ="<no title>";
  DateTime createdAt = DateTime.now();
  bool done = false;
  //ToDoRecord({required this.title});
  ToDoRecord();
  //ToDoRecord copy(ToDoRecord r) {
  ToDoRecord copy() {
    return ToDoRecord()
      ..id = id
      ..title = title
      ..createdAt = createdAt
      ..done = done
    ;
  }
}


