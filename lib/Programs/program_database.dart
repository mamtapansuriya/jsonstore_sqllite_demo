import 'dart:developer';
import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class ProgramDatabaseHelper {
  static final ProgramDatabaseHelper instance = ProgramDatabaseHelper._init();
  static Database? programDatabase;
  ProgramDatabaseHelper._init();

  static Future<Database?> get initData async {
    log("called initdata for get");

    if (programDatabase != null) {
      return programDatabase;
    }
    programDatabase = (await initDataBase())!;
    return programDatabase;
  }

  static initDataBase() async {
    try {
      Directory documentsDirectory = await getApplicationDocumentsDirectory();
      String path = join(documentsDirectory.path, "programDatabase.db");

      return await openDatabase(path, version: 1, onOpen: (db) {}, onCreate: (Database db, int version) async {
        await db
            .execute(
                'CREATE TABLE programData(cashbacks INTEGER, categories INTEGER, descriptionMd TEXT, externalId TEXT, id TEXT PRIMARY KEY NOT NULL, logoUrl TEXT, name TEXT, tags TEXT, trackingUrl TEXT, dataTransaction TEXT, vouchers INTEGER, conditionsMd TEXT, originName TEXT)')
            .then((value) => print("Create programData"));
      });
    } catch (e) {
      print("-------error in create programData database");
    }
  }
}
