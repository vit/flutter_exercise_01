/*

import 'dart:async';

import 'package:path/path.dart';
import 'package:rxdart/rxdart.dart';

import 'package:sqflite/sqflite.dart';

import '../../interfaces/data/DbService.dart';
import '../../interfaces/data/ToDoItem.dart';


import 'dart:developer';

class SQLiteDb extends DbService {
  Database? db;

  // final List<ToDoItem> _items = [
  //   ToDoItem(title: "Predefined ToDo Item 001"),
  //   ToDoItem(title: "Predefined ToDo Item 002"),
  //   ToDoItem(title: "Predefined ToDo Item 003"),
  // ];

  final _itemsStreamController = BehaviorSubject<List<ToDoItem>>();

  SQLiteDb() {
    log("%% Before _connect()");
    _connect();
    log("%% After _connect()");
  }

  Stream<List<ToDoItem>> getItemsStream() {
    return _itemsStreamController.stream;
  }

  @override
  addNewItem(ToDoItem item) {
    Map<String, dynamic> row = {
      "title": item.title,
      "created_at": DateTime.now().millisecondsSinceEpoch,
      "done": 0,
    };
    db!.insert("items", row).then((rec) {
      _loadItems();
    });
    //_items.add(item);
    //_loadItems();
  }

  @override
  updateItem(ToDoItem item) async {
    log("updateItem() " + item.toString());
    //
  }

  _loadItems() async {
    List<Map<String, dynamic>> maps = await db!.query('items', orderBy: "created_at desc");
    List<ToDoItem> items = maps.map((e) => ToDoItem(
        title: e['title'],
        createdAt: DateTime.fromMillisecondsSinceEpoch(e['created_at']),
        done: e['done'] != 0
    )).toList();
    _notifyItemsList(items);
  }

  _connect() {
    log("%% Before openDatabase()");
    getDatabasesPath().then((db_path) {
      openDatabase(
        join(db_path, 'my_todo_1.db'),
        onCreate: (db, version) {
          log("%% Inside onCreate");
          return db.execute(
            'CREATE TABLE items(id INTEGER PRIMARY KEY, title TEXT, created_at INTEGER, done INTEGER)',
          );
        },
        version: 1,
      ).then((_db) {
        log("%% After openDatabase()");
        db = _db;
        _loadItems();
      });
    });

  }


  _notifyItemsList(itemsList) {
    //_itemsStreamController.sink.add(_items);
    _itemsStreamController.sink.add(itemsList);
  }

}


*/
