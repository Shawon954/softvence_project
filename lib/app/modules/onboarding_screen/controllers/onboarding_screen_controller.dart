import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:softvence_project/app/routes/app_pages.dart';
import 'package:softvence_project/app/utilities/app_String.dart';
import 'package:softvence_project/app/utilities/app_images.dart';

import '../model/onboarding_model.dart';

class OnboardingScreenController extends GetxController {
  final box = GetStorage();
  final pageController = PageController();

  var currentPage = 0.obs;

  void nextPage(int index) {
    currentPage.value = index;
  }

  void SkipToHome() {
    box.write('finish', true);
    Get.offAllNamed(Routes.LOCATION_SCREEN);
  }

  void nextScreen() {
    if (currentPage.value < onboardingList.length - 1) {
      pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      box.write('finish', true);
      Get.offAllNamed(Routes.LOCATION_SCREEN);
    }
  }

  final List<OnboardingModel> onboardingList = [
    OnboardingModel(
      ImageUrl: AppImage.onboarding1,
      Title: AppString.onBoardingTitle1,
      Subtitle: AppString.onBoardingSubtitle1,
    ),
    OnboardingModel(
      ImageUrl: AppImage.onboarding2,
      Title: AppString.onBoardingTitle2,
      Subtitle: AppString.onBoardingSubtitle2,
    ),
    OnboardingModel(
      ImageUrl: AppImage.onboarding3,
      Title: AppString.onBoardingTitle3,
      Subtitle: AppString.onBoardingSubtitle3,
    ),
  ];
}
