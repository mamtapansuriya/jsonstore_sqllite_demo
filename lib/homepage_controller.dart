import 'dart:io';

import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import 'package:http/http.dart' as http;

/// https://data.mycashbacks.com/app/4/1a43dfd0-5ce1-47ef-a7c3-e8e4b3ed3b60.json // json file
class HomePageController extends GetxController {
  File? docFile;

  Future<void> downloadUrl(String url, String filename) async {
    try {
      final docDir = await getApplicationDocumentsDirectory();

      String docPath = docDir.path;

      docFile = File('$docPath/$filename');
      print(' doc file-------------${docFile?.path} exits');

      http.Response response = await http.get(Uri.parse(url));

      await docFile?.writeAsBytes(response.bodyBytes, flush: true);
    } catch (e, st) {
      print("----error in downloadUrl-----------$e,$st");
    }
  }

  Future<dynamic> readFileData() async {
    try {
      final userData = await docFile?.readAsString();
      return userData;
    } catch (e) {
      print("-------error in readFileData-----$e");
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    downloadUrl("https://data.mycashbacks.com/app/4/1a43dfd0-5ce1-47ef-a7c3-e8e4b3ed3b60.json", "cashback.json");
  }
}
