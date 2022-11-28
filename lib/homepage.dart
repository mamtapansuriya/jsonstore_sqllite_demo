import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stepperclass_demo/Utils/page_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.toNamed(Routes.cashbackPage);
                },
                child: const Text("Cashback Data")),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed(Routes.voucherPage);
                },
                child: const Text("VoucherData Data")),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed(Routes.categoriesPage);
                },
                child: const Text("Categories Data")),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed(Routes.programPage);
                },
                child: const Text("Program Data")),
          ],
        ),
      ),
    ));
  }
}
