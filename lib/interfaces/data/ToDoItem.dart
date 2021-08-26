
class ToDoItem {
  int id = 0;
  String title;
  DateTime createdAt = DateTime.now();
  bool done = false;

  //factory ToDoItem.byTitle(this.title);
  ToDoItem({
    this.id = 0,
    required this.title,
    DateTime? createdAt,
    bool? done
  }) {
    this.createdAt = createdAt ?? DateTime.now();
    this.done = done ?? false;
  }

}
