import 'package:flutter/material.dart';
import 'package:to_do_machine_task/core/style/app_text_style.dart';
import 'package:to_do_machine_task/core/style/colors.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = blueClr,
    this.textColor = whiteClr,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 53,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: EdgeInsets.symmetric(vertical: 16), 
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3), 
          ),
        ),
        child: Text(
          text,
          style: AppTextStyle.appTextStyle_14_800.copyWith(color: whiteClr,fontSize: 12),
        ),
      ),
    );
  }
}
