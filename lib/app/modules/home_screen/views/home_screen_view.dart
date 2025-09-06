import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:softvence_project/app/commn_widgets/custom_button.dart';
import 'package:softvence_project/app/utilities/app_String.dart';
import 'package:softvence_project/app/utilities/app_textstyle.dart';

import '../../../constant/app_colors.dart';
import '../controllers/home_screen_controller.dart';

class HomeScreenView extends GetView<HomeScreenController> {
  const HomeScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.blackSecondaryColor,

        body: Padding(
          padding: EdgeInsets.all(12.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Center(
                  child: Container(
                    height: 150.h,
                    width: 250.w,

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(
                          AppString.selectLocation,
                          style: mediumTextStyle(
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w600,
                            size: 16,
                          ),
                        ),
                        Gap(10.h),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Icon(
                                Icons.location_on_outlined,
                                color: AppColors.whiteColor,
                                size: 24,
                              ),
                            ),
                            Gap(10.w),
                            Expanded(
                              flex: 8,
                              child: Text(
                                AppString.userplace,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: mediumTextStyle(
                                  color: AppColors.whiteColor,
                                  size: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Gap(15.h),
                        CustomButton(
                          height: 48,
                          width: 268,
                          backgroundColor: AppColors.blackliteColor,
                          text: AppString.addalarm,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppString.alarmText,
                      style: mediumTextStyle(
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w600,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
