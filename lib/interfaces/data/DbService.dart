
import 'dart:async';
//import 'package:rxdart/rxdart.dart';

import 'package:flutter_todo_01/data/local/objectbox/ToDoRecord.dart';

abstract class DbService {

  Stream<List<ToDoRecord>> getItemsStream();

  addNewItem(ToDoRecord item);
  updateItem(ToDoRecord item);
  deleteItem(ToDoRecord item);


}

