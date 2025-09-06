import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:softvence_project/app/modules/onboarding_screen/bindings/onboarding_screen_binding.dart';
import 'package:softvence_project/app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await ScreenUtil.ensureScreenSize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          title: 'Softvence Project',
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.ONBOARDING_SCREEN,
          getPages: AppPages.routes,
          initialBinding: OnboardingScreenBinding(),
        );
      },
    );
  }
}
