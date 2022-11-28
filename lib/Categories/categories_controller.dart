import 'dart:convert';
import 'package:get/get.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:stepperclass_demo/Categories/categories_database.dart';
import 'package:stepperclass_demo/Categories/categories_model.dart';
import 'package:stepperclass_demo/homepage_controller.dart';

class CategoriesController extends GetxController {
  final HomePageController _homePageController = Get.find();
  List<CategoriesModel> categoriesList = [];
  Database? categoriesDB;
  Future<void> writeCategoriesData() async {
    try {
      final userData = await _homePageController.docFile?.readAsString();
      List dataList = [];
      dataList = await json.decode(userData!)["categories"];

      for (var element in dataList) {
        CategoriesModel data = CategoriesModel.fromJson(element);
        await categoriesDB?.insert("categoriesData", data.toDataBase(), conflictAlgorithm: ConflictAlgorithm.replace);
      }
    } catch (e, st) {
      print("------error in -------$e,$st");
    }
  }

  Future<void> getCategoriesData() async {
    try {
      final List<Map<String, dynamic>> getData = await categoriesDB!.rawQuery("select * from categoriesData");
      for (var element in getData) {
        CategoriesModel category = CategoriesModel(
          id: element['id'],
          name: nameFromJson(element['name'].toString()),
          parentIds: element['parent_ids'].toString().split(','),
        );
        categoriesList.add(category);
      }
      for (var element in categoriesList) {
        print("------categories id-------${element.id}");
      }
    } catch (e) {
      print("----error in getCategories Data--------$e");
    }
  }

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    categoriesDB = await CategoriesDatabaseHelper.initData;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    categoriesDB?.close();
  }
}
