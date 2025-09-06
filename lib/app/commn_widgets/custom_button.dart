import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:softvence_project/app/constant/app_colors.dart';
import '../utilities/app_textstyle.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final double fontSize;
  final double width;
  final double height;
  final double radius;
  final IconData? icon; // optional icon

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = AppColors.purpleColor,
    this.fontSize = 16,
    this.width = 328,
    this.height = 56,
    this.radius = 8,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        minimumSize: Size(width, height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: boldTextStyle(
              color: AppColors.whiteColor,
              size: fontSize,
              fontweight: FontWeight.bold,
            ),
          ),
          if (icon != null) ...[
            Gap(8.w),
            Icon(icon, color: AppColors.whiteColor),
          ],
        ],
      ),
    );
  }
}
