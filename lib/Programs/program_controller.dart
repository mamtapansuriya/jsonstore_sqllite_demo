import 'dart:convert';

import 'package:get/get.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:stepperclass_demo/Programs/program_database.dart';
import 'package:stepperclass_demo/Programs/program_model.dart';
import 'package:stepperclass_demo/homepage_controller.dart';

class ProgramController extends GetxController {
  Database? programDB;
  HomePageController _homePageController = Get.find();
  List<Programs> programList = [];
  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    programDB = await ProgramDatabaseHelper.initData;
  }

  Future<void> writeProgramData() async {
    try {
      final userData = await _homePageController.readFileData();
      List dataList = [];
      dataList = await json.decode(userData!)["programs"];

      for (var element in dataList) {
        Programs data = Programs.fromJson(element);

        await programDB?.insert("programData", data.toDataBase(), conflictAlgorithm: ConflictAlgorithm.replace);
      }

      /// insert data into sqlLite categoriesdatabase

    } catch (e, st) {
      print("------error in -------$e,$st");
    }
  }

  RxBool isData = false.obs;
  Future<void> readProgramData() async {
    try {
      isData.value = true;
      final List<Map<String, dynamic>> getData = await programDB!.rawQuery("select * from programData");
      for (var element in getData) {
        Programs programs = Programs(
          id: element["id"],
          name: element["name"],
          logoUrl: element["logoUrl"],
        );
        programList.add(programs);
      }
      isData.value = false;
      for (var element in programList) {
        print("------program id-------${element.id}");
      }
    } catch (e) {
      isData.value = false;
      print("----error in getProgram Data--------$e");
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    programDB?.close();
  }
}
