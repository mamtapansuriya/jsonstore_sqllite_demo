import 'package:get/get.dart';
import 'package:stepperclass_demo/Cashback/cashback_page.dart';
import 'package:stepperclass_demo/Categories/categories_page.dart';
import 'package:stepperclass_demo/Programs/program_page.dart';
import 'package:stepperclass_demo/homepage.dart';
import 'package:stepperclass_demo/voucher/voucher_page.dart';

mixin Routes {
  static const defaultTransition = Transition.rightToLeft;
  static const String voucherPage = '/voucherPage';
  static const String cashbackPage = '/cashbackPage';
  static const String categoriesPage = "/categoriesPage";
  static const String programPage = "/programPage";
  static const String homePage = "/homePage";

  static List<GetPage<dynamic>> getPages = [
    GetPage<dynamic>(
      name: homePage,
      page: () => HomePage(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: voucherPage,
      page: () => VoucherPage(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: cashbackPage,
      page: () => CashbackPage(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: categoriesPage,
      page: () => CategoriesPage(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: programPage,
      page: () => ProgramPage(),
      transition: defaultTransition,
    ),
  ];
}
