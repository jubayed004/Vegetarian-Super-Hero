import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:vegetarian_super_hero/utils/app_strings/app_strings.dart';
import 'package:vegetarian_super_hero/utils/color/app_colors.dart';
import 'package:vegetarian_super_hero/utils/extension/base_extension.dart';

class RegeneratePlanCard extends StatelessWidget {
  const RegeneratePlanCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.surfaceDeep,
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(color: AppColors.dividerGrey.withValues(alpha: 0.1)),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.goldAccent.withValues(alpha: 0.1),
              border: Border.all(
                color: AppColors.goldAccent.withValues(alpha: 0.2),
              ),
            ),
            child: Icon(
              Icons.refresh_rounded,
              color: AppColors.goldAccent,
              size: 24.r,
            ),
          ),
          Gap(16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.regenerate.tr,
                  style: context.titleMedium.copyWith(fontSize: 16),
                ),
                Gap(4.h),
                Text(
                  "3 ${AppStrings.regenerations.tr} remaining this cycle",
                  style: context.bodySmall.copyWith(
                    color: AppColors.textGrey,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.chevron_right_rounded,
            color: AppColors.textGrey.withValues(alpha: 0.5),
            size: 24.r,
          ),
        ],
      ),
    );
  }
}
