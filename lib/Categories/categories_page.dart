import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stepperclass_demo/Categories/categories_controller.dart';

class CategoriesPage extends StatelessWidget {
  CategoriesPage({Key? key}) : super(key: key);
  final CategoriesController _categoriesController = Get.put(CategoriesController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: const Text("Categories Data")),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: () {
                    _categoriesController.writeCategoriesData();
                  },
                  child: const Text("Read Data")),
              ElevatedButton(
                  onPressed: () async {
                    await _categoriesController.getCategoriesData();
                  },
                  child: const Text("get Data")),
            ],
          ),
          Expanded(
              child: ListView.builder(
            itemCount: _categoriesController.categoriesList.length,
            itemBuilder: (context, i) {
              final data = _categoriesController.categoriesList[i];
              return ListTile(
                title: Text(data.id.toString()),
                subtitle: Text(data.name!.de.toString()),
              );
            },
          ))
        ],
      ),
    ));
  }
}
