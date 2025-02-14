import 'package:flutter/material.dart';
import 'package:to_do_machine_task/app/widgets/app_button.dart';
import 'package:to_do_machine_task/app/widgets/app_text_field.dart';

class TitleDialog extends StatelessWidget {
  final Function(String, String)? onSubmit;

  TitleDialog({this.onSubmit});

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController iconController = TextEditingController();

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.white,
      insetPadding: EdgeInsets.all(30),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppTextField(
              label: "Icon (e.g., 😊)",
              controller: iconController,
              hasShadow: false,
            ),
            SizedBox(height: 10),
            AppTextField(
              label: "Title",
              controller: titleController,
              hasShadow: false,
            ),
            SizedBox(height: 20),
            AppButton(
                text: "Submit",
                onPressed: () {
                  onSubmit!(
                      titleController.text.trim(), iconController.text.trim());
                }),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
