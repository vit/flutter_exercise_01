
import 'dart:async';
import 'package:rxdart/rxdart.dart';

import '../../interfaces/data/DbEvent.dart';
import '../../interfaces/data/DbCommand.dart';

//import 'ToDoItem.dart';
import 'package:flutter_todo_01/data/local/objectbox/ToDoRecord.dart';


//import 'dart:developer';

abstract class DbService {

  //Stream<List<ToDoItem>> getItemsStream();
  Stream<List<ToDoRecord>> getItemsStream();


  // final _eventsStreamController = BehaviorSubject<DbEvent>(); //.seeded( DbSendItemsListEvent(items: []) );
  // Stream<DbEvent> get events => _eventsStreamController.stream;
  //
  // final _commandsStreamController = BehaviorSubject<DbCommand>();
  // StreamSink<DbCommand> get commands => _commandsStreamController.sink;
  //
  // Db() {
  //   _commandsStreamController.stream.listen((cmd) {
  //
  //     //log('cmd: $cmd');
  //
  //
  //     if(cmd is DbAddByTitleCommand) {
  //       String text = (cmd as DbAddByTitleCommand).title;
  //       //items.add( ToDoItem(title: text) );
  //       this.addItem( ToDoItem(title: text) );
  //     }
  //   });
  // }

  //addNewItem(ToDoItem item);
  //updateItem(ToDoItem item);
  addNewItem(ToDoRecord item);
  updateItem(ToDoRecord item);
  deleteItem(ToDoRecord item);

/*
  notifyItemsList( List<ToDoItem> items ) {
    _eventsStreamController.add(DbSendItemsListEvent(items: items));
  }

  @override
  void dispose() {
    _eventsStreamController.close();
    _commandsStreamController.close();
  }
*/




}

