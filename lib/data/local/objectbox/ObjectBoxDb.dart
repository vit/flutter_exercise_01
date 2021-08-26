
import 'dart:async';
import 'dart:developer';

import 'package:path_provider/path_provider.dart';
import 'package:rxdart/rxdart.dart';

import '../../../interfaces/data/DbService.dart';
import '../../../objectbox.g.dart';
import 'ToDoRecord.dart';

class ObjectBoxDb extends DbService {
  final _store;
  late final _recordsBox = _store.box<ToDoRecord>();

  ObjectBoxDb._internal({required Store store}) : _store = store {
    _loadItems();
  }

  static getService() async {
    final path = (await getApplicationDocumentsDirectory()).path;
    final Store store = await openStore( directory: path );
    return ObjectBoxDb._internal(store: store);
  }

  final _itemsStreamController = BehaviorSubject<List<ToDoRecord>>();

  Stream<List<ToDoRecord>> getItemsStream() {
    return _itemsStreamController.stream;
  }

  @override
  addNewItem(ToDoRecord item) async {
    _recordsBox.put(
        ToDoRecord()
          ..title=item.title
    );
    _loadItems();
  }

  @override
  updateItem(ToDoRecord item) async {
    var id = _recordsBox.put(
        ToDoRecord()
          ..id=item.id
          ..title=item.title
          ..createdAt=item.createdAt
          ..done=item.done
    );
    _loadItems();
  }

  @override
  deleteItem(ToDoRecord item) async {
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
    List<ToDoRecord> items = query.find();
    _notifyItemsList(items);
  }

  _notifyItemsList(itemsList) {
    _itemsStreamController.sink.add(itemsList);
  }

}


