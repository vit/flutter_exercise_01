
import 'ToDoItem.dart';

abstract class DbEvent{}
class DbSendItemsListEvent extends DbEvent{
  final List<ToDoItem> items;
  DbSendItemsListEvent({required this.items});
}


