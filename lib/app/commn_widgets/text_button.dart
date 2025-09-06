import 'package:flutter/material.dart';

import '../constant/app_colors.dart';
import '../utilities/app_textstyle.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.text,
    required this.onPressed,
  });
  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: boldTextStyle(
          color: AppColors.whiteColor,
          size: 16,
          fontweight: FontWeight.bold,
        ),
      ),
    );
  }
}
