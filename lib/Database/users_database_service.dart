import 'package:foodiee/Database/users_model_class.dart';
import 'package:sqflite/sql.dart';
import 'db_helper.dart';

class UsersDatabaseService {
  final db = Db();

  Future<bool> insert(UsersModelClass users) async {
    var db = await Db().database;
    int rowId = await db.insert(UsersModelClass.tableName, users.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return rowId > -1;
  }

  Future<bool> update(UsersModelClass users) async {
    var db = await Db().database;
    int rowId = await db.update(UsersModelClass.tableName, users.toMap(),
        where: '${UsersModelClass.colEmail} = ?',
        whereArgs: [users.email],
        conflictAlgorithm: ConflictAlgorithm.replace);
    return rowId > -1;
  }

  Future<bool> delete(UsersModelClass users) async {
    var db = await Db().database;
    int rowId = await db.delete(
      UsersModelClass.tableName,
      where: '${UsersModelClass.colEmail} = ?',
      whereArgs: [users.email],
    );
    return rowId > -1;
  }

  Future<bool> deleteAllNotes() async {
    var db = await Db().database;
    int rowId = await db.delete(UsersModelClass.tableName);
    return rowId > 0;
  }

  Future<List<UsersModelClass>> fetch() async {
    var db = await Db().database;
    var notesMaps = await db.query(UsersModelClass.tableName);
    // print("Fetched Data from DB: $notesMaps");
    var list = notesMaps
        .map(
          (map) => UsersModelClass.fromMap(map),
        )
        .toList();
    // print("list: $list");
    return list;
  }
}
