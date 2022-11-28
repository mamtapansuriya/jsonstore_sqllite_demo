import 'dart:convert';
import 'package:get/get.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:stepperclass_demo/homepage_controller.dart';
import 'package:stepperclass_demo/voucher/voucher_database.dart';
import 'package:stepperclass_demo/voucher/voucher_model.dart';

class VoucherController extends GetxController {
  List<VoucherModel> voucherList = <VoucherModel>[];
  Database? voucherDB;
  final HomePageController _homePageController = Get.find();
  RxBool isData = false.obs;
  Future<void> readVoucher() async {
    try {
      final userData = await _homePageController.readFileData();
      List dataList = [];
      dataList = await json.decode(userData!)["vouchers"];

      for (var element in dataList) {
        VoucherModel data = VoucherModel.fromJson(element);

        await voucherDB?.insert("voucherData", data.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
      }
    } catch (e, st) {
      print("------error in -------$e,$st");
    }
  }

  Future<void> getVoucherData() async {
    try {
      isData.value = true;
      final List<Map<String, dynamic>> maps = await voucherDB!.rawQuery("select * from voucherData");
      voucherList.clear();
      for (var element in maps) {
        voucherList.add(VoucherModel.fromJson(element));
      }
      isData.value = false;
    } catch (e) {
      isData.value = false;
      print("-----error in getvoucherData----$e");
    }
  }

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    voucherDB = await VoucherDatabaseHelper.initData;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    voucherDB?.close();
  }
}
