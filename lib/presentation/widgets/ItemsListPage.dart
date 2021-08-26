import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_todo_01/data/local/objectbox/ToDoRecord.dart';
import 'package:intl/intl.dart';
//import 'package:rxdart/rxdart.dart';

//import '../../interfaces/data/ToDoItem.dart';

import '../blocs/ToDoBloc.dart';
import '../blocs/BlocProvider.dart';
import 'EditItemPage.dart';



class _OneItem extends StatelessWidget {
  //final ToDoItem item;
  final ToDoRecord item;

  _OneItem(this.item);

  @override
  Widget build (BuildContext ctx) {
    final bloc = BlocProvider.of(ctx)!.itemsListBloc;

    return
      Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            InkWell(
            onTap: () {
              Navigator.push(
                ctx,
                MaterialPageRoute(
                  builder: (context) => EditItemPage(item),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: <Widget>[
                  Expanded(child: Text(item.title)),
                  Checkbox(
                    value: item.done,
                    onChanged: (bool? newValue) {
                      log("new value: $newValue");
                      item.done = newValue ?? false;
                      bloc.commands_sink.add( ToDoUpdateCommand(item: item) );
                    },
                  ),
                ],
                ),
              ),
            ),
/*
            CheckboxListTile( //value: value, onChanged: onChanged)
              value: false,
              title: Text(item.title),
              subtitle: Text(
                "Создана: ${DateFormat('yyyy.MM.dd, HH:mm').format(item.createdAt)}",
                style: TextStyle(
                  fontFamily: 'georgia',
                  fontSize: 12,
                  color: Colors.red,
                ),
              ),
              onChanged: (value) {
                log("new value: $value");
              },
              // onTap: () {
              //   Navigator.push(
              //     ctx,
              //     MaterialPageRoute(
              //       builder: (context) => EditItemPage(item),
              //     ),
              //   );
              // },
            ),
*/
/*
            ListTile(
              title: Text(item.title),
              subtitle: Text(
                "Создана: ${DateFormat('yyyy.MM.dd, HH:mm').format(item.createdAt)}",
                style: TextStyle(
                  fontFamily: 'georgia',
                  fontSize: 12,
                  color: Colors.red,
                ),
              ),
              onTap: () {
                Navigator.push(
                  ctx,
                  MaterialPageRoute(
                    builder: (context) => EditItemPage(item),
                  ),
                );
              },
            ),
*/
          ],
        ),
      );
  }
}


class ItemsListPage extends StatelessWidget {
  final TextEditingController eCtrl = new TextEditingController();

  @override
  Widget build (BuildContext ctx) {
    var focusNode = FocusNode();

    var bloc = BlocProvider.of(ctx)!.itemsListBloc;

    return Column(
          children: <Widget>[
            // new TextField(
            //   focusNode: focusNode,
            //   controller: eCtrl,
            //   onSubmitted: (text) {
            //     bloc.commands_sink.add( ToDoAddByTitleCommand(title: text) );
            //     eCtrl.clear();
            //     focusNode.requestFocus();
            //   },
            // ),
            new Expanded(
              child: StreamBuilder(
                  stream: bloc.events_stream,
                  builder: (BuildContext context, AsyncSnapshot<ToDoEvent> snapshot) {
                    if( snapshot.data is ToDoSendItemsListEvent ) {
                      var event = snapshot.data as ToDoSendItemsListEvent;
                      var items = event.items;
                      // return AnimatedList(
                      //     initialItemCount: items.length,
                      //     itemBuilder: (BuildContext ctxt, int index, Animation animation) {
                      //       return _OneItem(
                      //           items.elementAt(index));
                      //     }
                      // );
                      return ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (BuildContext ctxt, int index) {
                            return _OneItem(
                                items.elementAt(index));
                          }
                      );
                    }
                    //bloc.commands_sink.add( ItemsListInitMeCommand() );
                    return Text( snapshot.data.runtimeType.toString() );
                  }
              ),
            )
          ],
    );


/*
    return new Scaffold(
        appBar: new AppBar(title: new Text("Список задач"),),
        body: new Column(
          children: <Widget>[
            new TextField(
              focusNode: focusNode,
              controller: eCtrl,
              onSubmitted: (text) {
                bloc.commands_sink.add( ToDoAddByTitleCommand(title: text) );
                eCtrl.clear();
                focusNode.requestFocus();
              },
            ),
            new Expanded(
              child: StreamBuilder(
                  stream: bloc.events_stream,
                  builder: (BuildContext context, AsyncSnapshot<ToDoEvent> snapshot) {
                    if( snapshot.data is ToDoSendItemsListEvent ) {
                      var event = snapshot.data as ToDoSendItemsListEvent;
                      var items = event.items;
                      return ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (BuildContext ctx, int index) {
                            return _OneItem(
                              items.elementAt(index));
                          }
                      );
                    }
                    //bloc.commands_sink.add( ItemsListInitMeCommand() );
                    return Text( snapshot.data.runtimeType.toString() );
                  }
              ),
            )
          ],
        )
    );
*/



  }
}
