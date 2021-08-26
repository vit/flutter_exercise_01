
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_todo_01/data/local/objectbox/ToDoRecord.dart';
import 'package:flutter_todo_01/interfaces/data/ToDoItem.dart';
import 'package:flutter_todo_01/presentation/blocs/BlocProvider.dart';
import 'package:flutter_todo_01/presentation/blocs/ToDoBloc.dart';

class ItemForm extends StatelessWidget {
  //final ToDoItem _item;
  final ToDoRecord item;
  final onChange;
  //ItemForm(item) : _item = item.copy(item);
  ItemForm(this.item, this.onChange);

  @override
  Widget build(BuildContext ctx) {
    final bloc = BlocProvider.of(ctx)!.itemsListBloc;
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ListTile(
              title: new TextFormField(
                initialValue: item.title,
                decoration: new InputDecoration(
                  labelText: 'Название задачи',
                ),
                onChanged: (newValue) {
                  item.title = newValue;
                },
              ),
            ),
            CheckboxListTile(
              title: Text("Сделано"),
              value: item.done,
              onChanged: (newValue) {
                log("onChanged: " + newValue.toString());
                onChange(() {
                  item.done = newValue ?? false;
                });
              },
            ),
            const Divider(
              height: 1.0,
            ),


/*
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if( item.id > 0 ) ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.redAccent[400],
                    onPrimary: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(ctx);
                  },
                  //child: const Text('Удалить'),
                  child: Row(
                    children: [
                      Icon(Icons.delete_outline),
                      Text('Удалить'),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amberAccent[400],
                    onPrimary: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(ctx);
                  },
                  child: Row(
                    children: [
                      Icon(Icons.cancel_outlined),
                      Text('Отмена'),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightGreenAccent[400],
                    onPrimary: Colors.black,
                  ),
                  onPressed: () {
                    bloc.commands_sink.add( ToDoUpdateCommand(item: item) );
                    Navigator.pop(ctx);
                  },
                  child: Row(
                    children: [
                      Icon(Icons.check_outlined),
                      Text('Сохранить'),
                    ],
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
*/
          ],
        ),
      ),
    );



  }
}
