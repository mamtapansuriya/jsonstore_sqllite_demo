import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stepperclass_demo/Programs/program_controller.dart';

class ProgramPage extends StatelessWidget {
  ProgramPage({Key? key}) : super(key: key);
  final ProgramController _programController = Get.put(ProgramController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Program Data")),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      _programController.writeProgramData();
                    },
                    child: const Text("write Data")),
                ElevatedButton(
                    onPressed: () async {
                      _programController.readProgramData();
                    },
                    child: const Text("read Data")),
              ],
            ),
            Obx(
              () => _programController.isData.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Expanded(
                      child: ListView.builder(
                        itemCount: _programController.programList.length,
                        itemBuilder: (context, i) {
                          final data = _programController.programList[i];
                          return ListTile(
                            leading: CircleAvatar(
                              radius: 30.0,
                              backgroundImage: NetworkImage("${data.logoUrl}"),
                              backgroundColor: Colors.transparent,
                            ),
                            title: Text(data.name.toString()),
                            subtitle: Text(data.id.toString()),
                          );
                        },
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
