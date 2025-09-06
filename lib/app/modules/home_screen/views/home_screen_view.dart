import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:softvence_project/app/commn_widgets/custom_button.dart';
import 'package:softvence_project/app/utilities/app_String.dart';
import 'package:softvence_project/app/utilities/app_textstyle.dart';

import '../../../constant/app_colors.dart';
import '../../location_screen/controllers/location_screen_controller.dart';
import '../controllers/home_screen_controller.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key, this.address});
  final String? address;
  @override
  Widget build(BuildContext context) {
    final locController = Get.put(LocationScreenController());
    final controller = Get.put(HomeScreenController());
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
                        GestureDetector(
                          onTap: () => controller.box.erase(),
                          child: Text(
                            AppString.selectLocation,
                            style: mediumTextStyle(
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.w600,
                              size: 16,
                            ),
                          ),
                        ),
                        Gap(10.h),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: GestureDetector(
                                onTap: () => locController.getUserLocation(),
                                child: Icon(
                                  Icons.location_on_outlined,
                                  color: AppColors.whiteColor,
                                  size: 24,
                                ),
                              ),
                            ),
                            Gap(10.w),
                            Expanded(
                              flex: 8,
                              child: Text(
                                "${address ?? "Address not found"}",
                                style: boldTextStyle(
                                  color: AppColors.whiteColor,
                                  size: 16,
                                  fontweight: FontWeight.w500,
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
                          onPressed: () async {
                            final now = DateTime.now();
                            final picked = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            if (picked != null) {
                              final time = DateTime(
                                now.year,
                                now.month,
                                now.day,
                                picked.hour,
                                picked.minute,
                              );
                              controller.addAlarm(time);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Obx(
                  () => ListView.builder(
                    itemCount: controller.alarms.length,
                    itemBuilder: (context, index) {
                      final alarm = controller.alarms[index];
                      return Card(
                        elevation: 2,
                        child: Container(
                          height: 84.h,
                          width: 328.w,
                          decoration: BoxDecoration(
                            color: AppColors.blackliteColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.r),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10.r),
                            child: Row(
                              children: [
                                Text(
                                  alarm['time'] ?? "",
                                  style: boldTextStyle(
                                    color: AppColors.whiteColor,
                                    size: 18,
                                    fontweight: FontWeight.w700,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  alarm['date'] ?? '',
                                  style: boldTextStyle(
                                    color: AppColors.whiteColor,
                                    size: 14,
                                    fontweight: FontWeight.w700,
                                  ),
                                ),
                                Gap(20.w),
                                SizedBox(
                                  height: 10.h,
                                  width: 30.w,
                                  child: Transform.scale(
                                    scale: 0.8,
                                    child: Switch(
                                      value: alarm['active'] ?? true,
                                      onChanged:
                                          (val) => controller.toggleAlarm(
                                            alarm['id'],
                                            val,
                                          ),
                                    ),
                                  ),
                                ),

                                IconButton(
                                  icon: Icon(
                                    Icons.close,
                                    color: AppColors.whiteColor,
                                    size: 24,
                                  ),
                                  onPressed:
                                      () => controller.deleteAlarm(alarm['id']),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              // Expanded(
              //   flex: 2,
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       // Container(
              //       //   height: 40.h,
              //       //   width: double.infinity,
              //       //   child: Text(
              //       //     AppString.alarmText,
              //       //     style: mediumTextStyle(
              //       //       color: AppColors.whiteColor,
              //       //       fontWeight: FontWeight.w600,
              //       //       size: 18,
              //       //     ),
              //       //   ),
              //       // ),
              //       Obx(
              //         () => ListView.builder(
              //           itemCount: controller.alarms.length,
              //           itemBuilder: (context, index) {
              //             final alarm = controller.alarms[index];
              //             return ListTile(
              //               leading: Icon(Icons.alarm),
              //               title: Text(controller.formatTime(alarm['time'])),
              //               trailing: IconButton(
              //                 icon: Icon(Icons.delete, color: Colors.red),
              //                 onPressed:
              //                     () => controller.deleteAlarm(alarm['id']),
              //               ),
              //             );
              //           },
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
