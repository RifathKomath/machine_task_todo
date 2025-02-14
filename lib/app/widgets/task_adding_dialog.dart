import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_machine_task/app/controller/task_controller.dart';
import 'package:to_do_machine_task/app/widgets/app_button.dart';
import 'package:to_do_machine_task/app/widgets/app_text_field.dart';
import '../../core/style/colors.dart';

class TaskAddingDialog extends StatelessWidget {
  TaskAddingDialog({super.key});
  final TaskController taskController = Get.find();
  final TextEditingController taskControllerField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: whiteClr,
          insetPadding: EdgeInsets.all(30),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppTextField(label: "Type your task...", controller: taskControllerField, hasShadow: false),
                AppButton(
                  text: "Submit",
                  onPressed: () {
                    if (taskControllerField.text.isNotEmpty) {
                      taskController.addTask(taskControllerField.text);
                      Get.back(); // Close dialog
                    }
                  },
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: 320,
          right: 18,
          child: GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black),
              padding: EdgeInsets.all(6),
              child: Icon(Icons.close, color: whiteClr, size: 18),
            ),
          ),
        ),
      ],
    );
  }
}
