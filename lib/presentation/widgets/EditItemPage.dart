
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_01/data/local/objectbox/ToDoRecord.dart';
import 'package:flutter_todo_01/presentation/blocs/ToDoBloc.dart';

import '../blocs/BlocProvider.dart';
import 'ItemForm.dart';

class EditItemPage extends StatefulWidget {
  final ToDoRecord item;
  const EditItemPage(this.item, {Key? key}) : super(key: key);

  @override
  _EditItemPageState createState() => _EditItemPageState(item);
}

class _EditItemPageState extends State<EditItemPage> {
  final ToDoRecord item;

  final _item;

  _EditItemPageState(this.item) : _item = item.copy();

  onChange(cb) {
    setState(() {
      cb();
    });
  }

  @override
  Widget build(BuildContext ctx) {
    final bloc = BlocProvider.of(ctx)!.itemsListBloc;

    return Scaffold(
      appBar: AppBar(
        title: Text("Править задачу: " + _item.title),
        actions: [
          IconButton(
            onPressed: () {
              bloc.commands_sink.add( ToDoDeleteCommand(item: _item) );
              Navigator.pop(ctx);
            },
            icon: Icon(Icons.delete),
            tooltip: "Удалить задачу",
          ),
        ],
      ),
      //body: ItemForm(item),
      body: ItemForm(_item, onChange),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bloc.commands_sink.add( ToDoUpdateCommand(item: _item) );
          Navigator.pop(ctx);
        },
        tooltip: 'Сохранть',
        child: const Icon(Icons.check),
      ),
    );
  }
}


