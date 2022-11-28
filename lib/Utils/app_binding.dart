import 'package:get/get.dart';
import 'package:stepperclass_demo/homepage_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomePageController());
  }
}
