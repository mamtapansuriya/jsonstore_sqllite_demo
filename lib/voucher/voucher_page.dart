import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stepperclass_demo/voucher/voucher_controller.dart';

class VoucherPage extends StatelessWidget {
  VoucherPage({Key? key}) : super(key: key);
  final VoucherController _voucherController = Get.put(VoucherController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: const Text("Voucher Data")),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: () {
                    _voucherController.readVoucher();
                  },
                  child: const Text("Write Data")),
              ElevatedButton(
                  onPressed: () async {
                    await _voucherController.getVoucherData();
                  },
                  child: const Text("Read Data")),
            ],
          ),
          Obx(
            () => _voucherController.isData.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Expanded(
                    child: ListView.builder(
                    itemCount: _voucherController.voucherList.length,
                    itemBuilder: (context, i) {
                      final data = _voucherController.voucherList[i];

                      return ExpansionTile(
                        title: Text(data.id.toString()),
                        subtitle: Text(
                          data.conditionMd.toString(),
                          overflow: TextOverflow.ellipsis,
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                      );
                    },
                  )),
          ),
        ],
      ),
    ));
  }
}
