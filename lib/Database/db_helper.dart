import 'package:foodiee/Database/users_model_class.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Db {
  static const dbName = "Users";
  static const version = 1;
  static Db? _instance;
//to make sure only one object of db is created
  Db._internal();
  factory Db() {
    return _instance ??= Db._internal();
  }

  Future<Database> get database async {
    var path = await getDatabasesPath();

    return openDatabase(
      join(path, dbName),
      version: version,
      onCreate: (db, version) {
        db.execute(UsersModelClass.createTable);
      },
    );
  }
}
