
import 'dart:async';

//import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/rxdart.dart';


import '../../../interfaces/data/DbService.dart';
//import '../../../interfaces/data/ToDoItem.dart';


import 'dart:developer';

import '../../../objectbox.g.dart';
import 'ToDoRecord.dart';

class ObjectBoxDb extends DbService {
  // final _store;
  // late final _recordsBox = _store.box<ToDoRecord>();
  var _store;
  var _recordsBox;

  // ObjectBoxDb._internal({required String path}) : _store = openStore( directory: path ) {
  //   _loadItems();
  // }
  ObjectBoxDb._internal({required String path}) {
    openStore( directory: path ).then((Store store) {
      _store = store;
      _recordsBox = _store.box<ToDoRecord>();
      _loadItems();
    });
  }

  static getBox() async {
    final path = (await getApplicationDocumentsDirectory()).path;
    return ObjectBoxDb._internal(path: path);
  }

  //final _itemsStreamController = BehaviorSubject<List<ToDoItem>>();
  final _itemsStreamController = BehaviorSubject<List<ToDoRecord>>();

  //Stream<List<ToDoItem>> getItemsStream() {
  Stream<List<ToDoRecord>> getItemsStream() {
    return _itemsStreamController.stream;
  }

  @override
  //addNewItem(ToDoItem item) async {
  addNewItem(ToDoRecord item) async {
    _recordsBox.put(
        ToDoRecord()
          ..title=item.title
    );
    _loadItems();
  }

  @override
  //updateItem(ToDoItem item) async {
  updateItem(ToDoRecord item) async {
    log("updateItem() " + item.toString());
    var id = _recordsBox.put(
        ToDoRecord()
          ..id=item.id
          ..title=item.title
          ..createdAt=item.createdAt
          ..done=item.done
    );
    log("id = $id");
    log("item.id = ${item.id}");
    log("item.title = ${item.title}");
    _loadItems();
  }

  @override
  //updateItem(ToDoItem item) async {
  deleteItem(ToDoRecord item) async {
    log("deleteItem() " + item.toString());
    var id = _recordsBox.remove( item.id );
    _loadItems();
  }

  dispose() {
    _store.close();
  }

  _loadItems() async {
    final query = (_recordsBox.query(
        //ToDoRecord_.id.greaterThan(0)
    )
    ..order(ToDoRecord_.createdAt, flags: Order.descending)
    )
        .build();
    //List<ToDoItem> items = query.find().map<ToDoItem>((e) =>
        // ToDoItem(
        //   id: e.id,
        //   title: e.title,
        //   createdAt: e.createdAt,
        //   done: e.done
        // )
    //).toList();
    List<ToDoRecord> items = query.find();
    _notifyItemsList(items);
  }

  _notifyItemsList(itemsList) {
    //_itemsStreamController.sink.add(_items);
    _itemsStreamController.sink.add(itemsList);
  }

}


