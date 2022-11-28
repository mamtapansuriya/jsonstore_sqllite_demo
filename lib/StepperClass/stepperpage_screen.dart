import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:stepperclass_demo/StepperClass/stepperpage_controller.dart';

class StepperPage extends StatelessWidget {
  StepperPage({Key? key}) : super(key: key);

  final StepperPageController _controller = Get.put(StepperPageController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => Stepper(
            type: StepperType.horizontal,
            currentStep: _controller.index.value,
            onStepCancel: () {
              if (_controller.index.value > 0) {
                _controller.index.value -= 1;
              }
            },
            onStepContinue: () {
              if (_controller.index.value <= 0) {
                _controller.index.value += 1;
              }
            },
            onStepTapped: (int index) {
              _controller.index.value = index;
            },
            steps: <Step>[
              Step(
                title: const Text('Step 1 title'),
                content: Container(alignment: Alignment.centerLeft, child: const Text('Content for Step 1')),
              ),
              const Step(
                title: Text('Step 2 title'),
                content: Text('Content for Step 2'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
