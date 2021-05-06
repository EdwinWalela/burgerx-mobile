import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'dart:async';
import '../models/User.dart';

class DbProvider {
  Database db;

  DbProvider() {
    init();
  }

  init() async {
    Directory docsDirectory = await getApplicationDocumentsDirectory();
    final path = join(docsDirectory.path, "burgerx.db");

    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database newDb, int version) {
        newDb.execute(
          """
            CREATE TABLE users
            (
              id INTEGER PRIMARY KEY,
              username VARCHAR(255),
              email VARCHAR(255),
              address VARCHAR(255),
              mobile VARCHAR(255),
              token VARCHAR(255)
            )
          """,
        );
      },
    );
  }

  void addUser(User user) async {
    final result = await db.query(
      "users",
      columns: ["email"],
      where: "email = ?",
      whereArgs: [user.email],
    );

    if (result.length == 0) {
      await db.insert(
        "users",
        user.toMap(),
      );
    }
  }
}