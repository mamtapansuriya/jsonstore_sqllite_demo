import 'dart:developer';
import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class CashbackDatabaseHelper {
  static final CashbackDatabaseHelper instance = CashbackDatabaseHelper._init();
  static Database? cashbackdatabase;
  CashbackDatabaseHelper._init();

  static Future<Database?> get initData async {
    log("called initdata for get");

    if (cashbackdatabase != null) {
      return cashbackdatabase;
    }
    cashbackdatabase = (await initDataBase())!;
    return cashbackdatabase;
  }

  static initDataBase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "cashbackdatabase.db");

    // String? descriptionMd;
    // String? id;
    // double? previousValue;
    // String? type;
    // double? value;
    // dynamic valueLabel;

    return await openDatabase(path, version: 1, onOpen: (db) {}, onCreate: (Database db, int version) async {
      await db
          .execute('CREATE TABLE cashbackdata(descriptionMd TEXT,id TEXT,previousValue DOUBLE,type TEXT,value DOUBLE,valueLabel TEXT)')
          .then((value) => print("Create voucher database"));
    });
  }
}
