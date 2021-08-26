import 'package:flutter/material.dart';

import 'interfaces/data/DbService.dart';

import 'presentation/blocs/BlocProvider.dart';
import 'presentation/widgets/home.dart';
import 'presentation/blocs/ToDoBloc.dart';

class MyApp extends StatelessWidget {
  //final AppConfig config;
  final DbService service;

  //MyApp(this.config, this.model);
  MyApp( this.service );

  // This widget is the root of your application.
  @override
/*
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
      //home: HomePageWidget(model),
      home: BlocProvider(
        //child: HomePageWidget(model),
        itemsListBloc: ToDoBloc(service),
        child: HomePageWidget(),
      ),
      //home: HomePageWidget(key: 123),
    );
  }
*/

  Widget build(BuildContext context) {
    return BlocProvider(
      itemsListBloc: ToDoBloc(service),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: HomePageWidget(),
      ),
    );



  }

}


