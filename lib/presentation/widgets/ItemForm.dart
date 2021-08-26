
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_todo_01/data/local/objectbox/ToDoRecord.dart';
import 'package:flutter_todo_01/presentation/blocs/BlocProvider.dart';

class ItemForm extends StatelessWidget {
  final ToDoRecord item;
  final onChange;

  ItemForm(this.item, this.onChange);

  @override
  Widget build(BuildContext ctx) {
    //final bloc = BlocProvider.of(ctx)!.itemsListBloc;
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
                onChange(() {
                  item.done = newValue ?? false;
                });
              },
            ),
            const Divider(
              height: 1.0,
            ),

          ],
        ),
      ),
    );



  }
}
