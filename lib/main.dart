import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stepperclass_demo/Utils/app_binding.dart';
import 'package:stepperclass_demo/Utils/page_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AppBinding(),
      initialRoute: Routes.homePage,
      getPages: Routes.getPages,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
