import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:vegetarian_super_hero/utils/app_strings/app_strings.dart';
import 'package:vegetarian_super_hero/utils/color/app_colors.dart';
import 'package:vegetarian_super_hero/utils/extension/base_extension.dart';

class SubscriptionInfoBox extends StatelessWidget {
  const SubscriptionInfoBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 2.h),
            child: Text("💡", style: TextStyle(fontSize: 16.sp)),
          ),
          Gap(12.w),
          Expanded(
            child: Text(
              AppStrings.vssIsACoachingSystemThatAdaptsWeeklyBasedOnYourRealProgressAndCheckIns.tr.replaceFirst("💡 ", ""),
              style: context.bodyMedium.copyWith(
                color: AppColors.textGreyLight,
                fontSize: 13.sp,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
