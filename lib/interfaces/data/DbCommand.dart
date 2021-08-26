
abstract class DbCommand{}
class DbAddByTitleCommand extends DbCommand{
  final String title;
  DbAddByTitleCommand({required this.title});
}

