import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class MyCurrent extends StatefulWidget {
  @override
  _MyCurrentState createState() => _MyCurrentState();
}

class _MyCurrentState extends State<MyCurrent> {

  String deadline(int days) {
    return DateFormat('yyyy.MM.dd').format(DateTime.now().add(Duration(days: days)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Текущее"),
        elevation: 10,
        actions: <Widget>[
          // action button
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
          // action button
        ],
      ),


      body: ListView(
          children: [
            Center(
              child: Padding(
//                  padding: EdgeInsets.all(15),
                padding: EdgeInsets.only(top: 20, bottom: 10),
                child: Text(
                  'Черновики',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.create),
                    title: Text('Подача статьи : Журнал ГиН'),
                    //subtitle: Text('Журнал "Гироскопия и Навигация"'),
                  ),
                  ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: const Text('Завершить начатое'),
                        onPressed: () { /* ... */ },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.event),
                    title: Text('Регистрация для участия : МКИНС 2020'),
                    subtitle: Text(
                      "Дедлайн: ${deadline(2)}",
                      style: TextStyle(
                        fontFamily: 'georgia',
                        color: Colors.red,
                      ),
                    ),
                  ),
                  ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: const Text('Завершить начатое'),
                        onPressed: () { /* ... */ },
                      ),
                    ],
                  ),
                ],
              ),
            ),





            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 20, bottom: 10),
                child: Text(
                  'Входящие задачи',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.event),
                    title: Text('МКИНС 2020'),
                    subtitle: Text(
                      "Дедлайн: ${deadline(5)}",
                      style: TextStyle(
                        fontFamily: 'georgia',
                        color: Colors.red,
                      ),
                    ),
                  ),
                  ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: const Text('Подать доклад'),
                        onPressed: () { /* ... */ },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.create),
                    title: Text('Подача статьи : Журнал ГиН'),
                    subtitle: Text(
                      "Дедлайн: ${deadline(5)}",
                      style: TextStyle(
                        fontFamily: 'georgia',
                        color: Colors.red,
                      ),
                    ),
                  ),
                  ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: const Text('Подать новую версию'),
                        onPressed: () { /* ... */ },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.create),
                    title: Text('Приглашение к рецензированию : Журнал ГиН'),
                    subtitle: Text(
                      "Дедлайн: ${deadline(3)}",
                      style: TextStyle(
                        fontFamily: 'georgia',
                        color: Colors.red,
                      ),
                    ),
                  ),
                  ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: const Text('Принять'),
                        onPressed: () { /* ... */ },
                      ),
                      FlatButton(
                        child: const Text('Отклонить'),
                        onPressed: () { /* ... */ },
                      ),
                    ],
                  ),
                ],
              ),
            ),




            Center(
              child: Padding(
//                  padding: EdgeInsets.all(15),
                padding: EdgeInsets.only(top: 20, bottom: 10),
                child: Text(
                  'Мои поданные',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.create),
                    title: Text('An Attitude Determination Algorithm based on Orthogonal Adaptive Kalman Filter'),
                    subtitle: Text(
                      "в Журнал ГиН",
                    ),
                  ),
                ],
              ),
            ),






            Center(
              child: Padding(
//                  padding: EdgeInsets.all(15),
                padding: EdgeInsets.all(40),
              ),
            ),


          ]
      ),




//        body: Center(
//          child: Text(
//            'Текущее',
////            style: optionStyle,
//          ),
//        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Новое',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
