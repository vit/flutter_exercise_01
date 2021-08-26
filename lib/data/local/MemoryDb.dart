/*

import 'dart:async';

import 'package:path/path.dart';
import 'package:rxdart/rxdart.dart';
//import 'package:sqflite/sqflite.dart';

import '../../interfaces/data/DbService.dart';
import '../../interfaces/data/ToDoItem.dart';


import 'dart:developer';

class MemoryDb extends DbService {

  final List<ToDoItem> _items = [
    ToDoItem(title: "Predefined ToDo Item 001"),
    ToDoItem(title: "Predefined ToDo Item 002"),
    ToDoItem(title: "Predefined ToDo Item 003"),
  ];

  final _itemsStreamController = BehaviorSubject<List<ToDoItem>>();


  MemoryDb() {
    _itemsStreamController.sink.add(_items);
  }

  @override
  addNewItem(ToDoItem item) {
     _items.add(item);
    _itemsStreamController.sink.add(_items);
  }

  @override
  updateItem(ToDoItem item) async {
    log("updateItem() " + item.toString());
    //
  }

  Stream<List<ToDoItem>> getItemsStream() {
    return _itemsStreamController.stream;
  }

}


*/
