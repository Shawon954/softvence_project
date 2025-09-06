import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:softvence_project/app/constant/app_colors.dart';
import 'package:softvence_project/app/utilities/app_String.dart';

import '../../../commn_widgets/custom_button.dart';
import '../../../commn_widgets/text_button.dart';
import '../../../utilities/app_textstyle.dart';
import '../controllers/onboarding_screen_controller.dart';

class OnboardingScreenView extends GetView<OnboardingScreenController> {
  const OnboardingScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingScreenController());

    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller.pageController,
                onPageChanged: (index) {
                  controller.currentPage.value = index;
                },
                children:
                    controller.onboardingList.map((item) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Expanded(
                            flex: 2,
                            child: Stack(
                              children: [
                                Image.asset(
                                  item.ImageUrl,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                                Positioned(
                                  top: 16,
                                  right: 16,
                                  child: CustomTextButton(
                                    text: 'Skip',
                                    onPressed: () => controller.SkipToHome(),
                                  ),
                                ),
                              ],
                            ),
                          ), // use your asset path
                          Gap(15.h),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.Title,
                                    style: mediumTextStyle(
                                      color: AppColors.whiteColor,
                                      size: 30,
                                    ),
                                  ),
                                  Gap(10.h),
                                  Text(
                                    item.Subtitle,
                                    style: regularTextStyle(
                                      color: AppColors.whiteColor,
                                      size: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
              ),
            ),
            SmoothPageIndicator(
              controller: controller.pageController,
              count: controller.onboardingList.length,
              effect: WormEffect(
                dotHeight: 8,
                dotWidth: 8,
                spacing: 8,
                radius: 16,
                dotColor: AppColors.greyColor,
                activeDotColor: AppColors.purpleColor,
              ),
            ),
            Gap(15.h),
            CustomButton(
              text: AppString.next,
              onPressed: () => controller.nextScreen(),
            ),

            Gap(15.h),
          ],
        ),
      ),
    );
  }
}
