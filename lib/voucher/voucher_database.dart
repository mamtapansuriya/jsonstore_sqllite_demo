import 'dart:developer';
import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class VoucherDatabaseHelper {
  static final VoucherDatabaseHelper instance = VoucherDatabaseHelper._init();
  static Database? voucherDatabase;
  VoucherDatabaseHelper._init();

  static Future<Database?> get initData async {
    log("called initdata for get");

    if (voucherDatabase != null) {
      return voucherDatabase;
    }
    voucherDatabase = (await initDataBase())!;
    return voucherDatabase;
  }

  static initDataBase() async {
    try {
      Directory documentsDirectory = await getApplicationDocumentsDirectory();
      String path = join(documentsDirectory.path, "voucherDatabase.db");

      // String? id;
      // String? code;
      // dynamic? conditionMd;
      // int? endDate;
      // String? descriptionMd;

      return await openDatabase(path, version: 1, onOpen: (db) {}, onCreate: (Database db, int version) async {
        await db
            .execute('CREATE TABLE voucherData(id TEXT,code TEXT,conditionMd TEXT,endDate INTEGER,descriptionMd TEXT)')
            .then((value) => print("Create database"));
      });
    } catch (e) {
      print("-------error in create voucher database");
    }
  }
}
