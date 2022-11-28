import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sqflite/sqlite_api.dart';
import 'package:stepperclass_demo/Cashback/cashback_database.dart';
import 'package:stepperclass_demo/Cashback/cashback_model.dart';
import 'package:stepperclass_demo/homepage_controller.dart';

class CashbackController extends GetxController {
  List<Cashback> cashbackList = <Cashback>[];
  Database? cashbackDB;
  RxBool isData = false.obs;
  final HomePageController _homePageController = Get.find();

  Future<void> writeData() async {
    try {
      final readData = await _homePageController.readFileData();
      List dataList = [];
      dataList = await json.decode(readData!)["cashbacks"];

      for (var element in dataList) {
        /// nsert data into sqlLite cashbackdatabase using inserquery
        Cashback cashback = Cashback.fromJson(element);
        await cashbackDB?.insert("cashbackdata", cashback.toDataBase(), conflictAlgorithm: ConflictAlgorithm.replace);
      }

      /// insert data into sqlLite cashbackdatabase using rawquery
      // cashbachList.forEach((element) async {
      //   print("element id is----${element.id}");
      //   await cashbachDB?.rawQuery(
      //       "insert into cashbackdata(descriptionMd,id,previousValue,type,value,valueLabel) values('${element.descriptionMd.toString()}','${element.id.toString()}','${element.previousValue.toString()}','${element.type.toString()}','${element.value.toString()}','${element.valueLabel.toString()}')");
      //
      //
      // });

    } catch (e, st) {
      print("------error in -------$e,$st");
    }
  }

  Future<void> getData() async {
    try {
      isData.value = true;
      final List<Map<String, dynamic>> maps = await cashbackDB!.rawQuery("select * from cashbackdata");

      cashbackList.clear();
      for (var elemet in maps) {
        Cashback cashback = Cashback(id: elemet["id"], descriptionMd: elemet["descriptionMd"]);
        cashbackList.add(cashback);
      }
      isData.value = false;
    } catch (e) {
      isData.value = false;
      print("--------error in get CsshbackData-------$e");
    }
  }

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    cashbackDB = await CashbackDatabaseHelper.initData;
  }
}
