import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'dart:async';
import '../models/User.dart';
import '../models/Cart_Item.dart';

class DbProvider {
  Database db;

  init() async {
    Directory docsDirectory = await getApplicationDocumentsDirectory();
    final path = join(docsDirectory.path, "burgerx.db");
    // await deleteDatabase(path);
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
            );
          """,
        );

        newDb.execute("""
         CREATE TABLE cart
            (
              id INTEGER PRIMARY KEY,
              _id VARCHAR(255),
              thumb VARCHAR(255),
              name VARCHAR(255),
              price INTEGER,
              quantity INTEGER
            );
            """);
      },
    );
    // (await db.query('sqlite_master', columns: ['type', 'name'])).forEach((row) {
    //   print(row.values);
    // });
  }

  close() async {
    await db.close();
  }

  Future<void> addUser(User user) async {
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

  Future<void> addCartItem(CartItem item) async {
    final result = await db.query(
      "cart",
      columns: null,
      where: "_id = ?",
      whereArgs: [item.id],
    );

    if (result.length == 0) {
      item.quantity = 1;
      await db.insert("cart", item.toMap());
    } else {
      CartItem existingItem = CartItem.fromDB(result[0]);
      existingItem.quantity++;
      await db.update(
        "cart",
        existingItem.toMap(),
        where: "_id=?",
        whereArgs: [existingItem.id],
      );
    }
  }

  Future<List> fetchCart() async {
    final result = await db.query(
      "cart",
      columns: ["_id", "thumb", "name", "price", "quantity"],
    );

    return result;
  }

  Future<User> fetchUser() async {
    final result = await db.query(
      "users",
      columns: null,
      limit: 1,
    );

    return result.length == 0 ? null : User.fromDB(result[0]);
  }
}

final dbProvider = DbProvider();
