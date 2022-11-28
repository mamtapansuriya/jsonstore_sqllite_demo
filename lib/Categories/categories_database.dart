import 'dart:developer';
import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class CategoriesDatabaseHelper {
  static final CategoriesDatabaseHelper instance = CategoriesDatabaseHelper._init();
  static Database? categoriesDatabase;
  CategoriesDatabaseHelper._init();

  static Future<Database?> get initData async {
    log("called initdata for get");

    if (categoriesDatabase != null) {
      return categoriesDatabase;
    }
    categoriesDatabase = (await initDataBase())!;
    return categoriesDatabase;
  }

  static initDataBase() async {
    try {
      Directory documentsDirectory = await getApplicationDocumentsDirectory();
      String path = join(documentsDirectory.path, "categoriesDatabase.db");

      return await openDatabase(path, version: 1, onOpen: (db) {}, onCreate: (Database db, int version) async {
        await db
            .execute('CREATE TABLE categoriesData(id TEXT PRIMARY KEY NOT NULL, name TEXT,'
                ' parent_ids TEXT)')
            .then((value) => print("Create categoriesData"));
      });
    } catch (e) {
      print("-------error in create categories database");
    }
  }
}
