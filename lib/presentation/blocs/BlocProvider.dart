import 'package:flutter/material.dart';

import 'ToDoBloc.dart';

class BlocProvider extends InheritedWidget {

  final ToDoBloc itemsListBloc;

  const BlocProvider({
    Key? key,
    required Widget child,
    required this.itemsListBloc,
  })  : assert(child != null),
        super(key: key, child: child);

  static BlocProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<BlocProvider>();
  }

  @override
  bool updateShouldNotify(BlocProvider old) {
    return true;
  }
}



