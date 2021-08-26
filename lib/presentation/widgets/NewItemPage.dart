
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_01/data/local/objectbox/ToDoRecord.dart';
import 'package:flutter_todo_01/presentation/blocs/ToDoBloc.dart';

import '../blocs/BlocProvider.dart';
import 'ItemForm.dart';


class NewItemPage extends StatefulWidget {
  const NewItemPage({Key? key}) : super(key: key);

  @override
  _NewItemPageState createState() => _NewItemPageState();
}

class _NewItemPageState extends State<NewItemPage> {
  final ToDoRecord item = ToDoRecord()..title = "";
  _NewItemPageState();

  onChange(cb) {
    setState(() {
      cb();
    });
  }

  @override
  Widget build(BuildContext ctx) {
    final bloc = BlocProvider.of(ctx)!.itemsListBloc;
    // final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Добавить задачу"),
      ),
      body: ItemForm(item, onChange),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bloc.commands_sink.add( ToDoUpdateCommand(item: item) );
          Navigator.pop(ctx);
        },
        tooltip: 'Сохранть',
        child: const Icon(Icons.check),
      ),
    );
  }
}


