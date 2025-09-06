import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:softvence_project/app/commn_widgets/custom_button.dart';
import 'package:softvence_project/app/constant/app_colors.dart';
import 'package:softvence_project/app/routes/app_pages.dart';
import 'package:softvence_project/app/utilities/app_String.dart';
import 'package:softvence_project/app/utilities/app_images.dart';
import 'package:softvence_project/app/utilities/app_textstyle.dart';

import '../controllers/location_screen_controller.dart';

class LocationScreenView extends StatelessWidget {
  const LocationScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LocationScreenController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.blackSecondaryColor,
        body: Padding(
          padding: EdgeInsets.all(10.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${AppString.welcometext}',
                style: boldTextStyle(color: AppColors.whiteColor, size: 34),
              ),
              Gap(10.h),
              Text(
                '${AppString.current_location}',
                style: boldTextStyle(color: AppColors.whiteColor, size: 14),
              ),
              Gap(20.h),
              Image.asset(AppImage.image1),
              Gap(20.h),
              CustomButton(
                text: AppString.useLocation,
                icon: Icons.place_outlined,
                onPressed: () {
                  controller.getUserLocation();
                  print('clikco');
                },
              ),
              Gap(8.h),
              CustomButton(
                text: AppString.homeText,
                onPressed: () => Get.offAllNamed(Routes.HOME_SCREEN),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
