import 'dart:developer';

import 'package:flutter/material.dart';

//import 'config/MyAppConfig.dart';
import 'MyApp.dart';

//import 'data/local/MemoryDb.dart';
//import 'data/local/SQLiteDb.dart';
import 'data/local/objectbox/ObjectBoxDb.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  var service = await ObjectBoxDb.getService();
  //var service = SQLiteDb();
  //var service = MemoryDb();

  runApp(MyApp( service ));
}

