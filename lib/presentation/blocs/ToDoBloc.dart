
import 'dart:async';
import 'dart:developer';
import 'package:flutter_todo_01/data/local/objectbox/ToDoRecord.dart';
import 'package:rxdart/rxdart.dart';

import '../../interfaces/data/DbService.dart';
// import '../../interfaces/data/DbCommand.dart';
// import '../../interfaces/data/DbEvent.dart';

//import '../../interfaces/data/ToDoItem.dart';



class ToDoBloc {
  DbService _service;

  //final _eventsStreamController = StreamController<ItemsListEvent>();
  final _eventsStreamController = BehaviorSubject<ToDoEvent>.seeded( ToDoSendItemsListEvent(items: []) );
  Stream<ToDoEvent> get events_stream => _eventsStreamController.stream;

  //final _commandsStreamController = StreamController<ItemsListCommand>();
  final _commandsStreamController = BehaviorSubject<ToDoCommand>();
  StreamSink<ToDoCommand> get commands_sink => _commandsStreamController.sink;

  ToDoBloc(this._service) {

    //_eventsStreamController.sink.add( ToDoSendItemsListEvent(items: _service.items) );

    _commandsStreamController.stream.listen((cmd) {
      log("cmd = " + cmd.toString());
      if(cmd is ToDoAddByTitleCommand) {
        String text = (cmd as ToDoAddByTitleCommand).title;
        //_service.addNewItem( ToDoItem(title: text) );
        _service.addNewItem( ToDoRecord()..title=text );
      }
      if(cmd is ToDoUpdateCommand) {
        //ToDoItem item = (cmd as ToDoUpdateCommand).item;
        ToDoRecord item = (cmd as ToDoUpdateCommand).item;
        _service.updateItem( item );
      }
      if(cmd is ToDoDeleteCommand) {
        //ToDoItem item = (cmd as ToDoUpdateCommand).item;
        ToDoRecord item = (cmd as ToDoDeleteCommand).item;
        _service.deleteItem( item );
      }
    });

    _service.getItemsStream().listen((items) {
        _eventsStreamController.add(ToDoSendItemsListEvent(items: items));
    });

  }

  @override
  void dispose() {
    _eventsStreamController.close();
    _commandsStreamController.close();
  }
}


abstract class ToDoEvent{}
class ToDoSendItemsListEvent extends ToDoEvent{
  //final List<ToDoItem> items;
  final List<ToDoRecord> items;
  ToDoSendItemsListEvent({required this.items});
}

abstract class ToDoCommand{}
class ToDoAddByTitleCommand extends ToDoCommand{
  final String title;
  ToDoAddByTitleCommand({required this.title});
}
class ToDoUpdateCommand extends ToDoCommand{
  //final ToDoItem item;
  final ToDoRecord item;
  ToDoUpdateCommand({required this.item});
}
class ToDoDeleteCommand extends ToDoCommand{
  //final ToDoItem item;
  final ToDoRecord item;
  ToDoDeleteCommand({required this.item});
}


