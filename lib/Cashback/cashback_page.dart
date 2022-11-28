import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stepperclass_demo/Cashback/cashback_controller.dart';

class CashbackPage extends StatelessWidget {
  CashbackPage({Key? key}) : super(key: key);
  final CashbackController _cashbackController = Get.put(CashbackController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Cashback Data")),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      _cashbackController.writeData();
                    },
                    child: const Text("Write Data")),
                ElevatedButton(
                    onPressed: () async {
                      await _cashbackController.getData();
                    },
                    child: const Text("Read Data")),
              ],
            ),
            Obx(
              () => _cashbackController.isData.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Expanded(
                      child: ListView.builder(
                      itemCount: _cashbackController.cashbackList.length,
                      itemBuilder: (context, i) {
                        final data = _cashbackController.cashbackList[i];

                        return ListTile(
                          title: Text(data.id.toString()),
                          subtitle: Text(
                            data.descriptionMd.toString(),
                            overflow: TextOverflow.ellipsis,
                          ),
                        );
                      },
                    )),
            ),
          ],
        ),
      ),
    );
  }
}
