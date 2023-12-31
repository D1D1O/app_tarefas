import 'package:projeto_001/data/task_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


Future<Database> getDatabase() async {
  String path = join(await getDatabasesPath(), 'task.db');

  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(TaskDao.tableSql);
    },
    version: 1,
  );
}

