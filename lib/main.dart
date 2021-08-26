import 'dart:io';

import 'package:flutter/material.dart';
//import 'package:path_provider/path_provider.dart';
//import 'package:sqflite/sqflite.dart';

import 'config/MyAppConfig.dart';
import 'MyApp.dart';

//import 'data/local/SQLiteDb.dart';
import 'data/local/objectbox/ObjectBoxDb.dart';
//import 'data/local/MemoryDb.dart';

import 'dart:developer';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  // Directory appDocDir = await getApplicationDocumentsDirectory();
  // String appDocPath = appDocDir.path;

  // Directory appSupportDir = await getApplicationSupportDirectory();
  // String appSupportPath = appSupportDir.path;

  //log("appDocPath = $appDocPath");
  //log("appSupportPath = $appSupportPath");
  //log("appLibPath = $appLibPath");

  //var path = await getDatabasesPath();

  //var config = MyAppConfig();

  var service = await ObjectBoxDb.getBox();
  //var service = ObjectBoxDb(path: appDocPath);
  //var service = SQLiteDb();
  //var service = MemoryDb();

  //runApp(MyApp( config, model ));
  runApp(MyApp( service ));
}

