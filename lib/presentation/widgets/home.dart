import 'package:flutter/material.dart';

import 'ItemsListPage.dart';
import 'NewItemPage.dart';

class HomePageWidget extends StatefulWidget {
  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {

  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: new Text("Список задач"),),
      body: ItemsListPage(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewItemPage(),
          ),
        ),
        tooltip: 'New task',
        child: const Icon(Icons.add),
      ),
    );
  }
}



