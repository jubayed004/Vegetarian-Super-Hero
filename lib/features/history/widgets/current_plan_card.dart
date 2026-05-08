import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:vegetarian_super_hero/utils/app_strings/app_strings.dart';
import 'package:vegetarian_super_hero/utils/color/app_colors.dart';
import 'package:vegetarian_super_hero/utils/extension/base_extension.dart';

class CurrentPlanCard extends StatelessWidget {
  const CurrentPlanCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.darkSurface,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.darkBorder, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.currentPlanV1.tr,
                    style: context.bodyMedium.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                  Gap(4.h),
                  Text(
                    "${AppStrings.week.tr} 10 · ${AppStrings.muscleGain.tr}",
                    style: context.bodySmall.copyWith(
                      color: AppColors.darkSecondaryText,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: AppColors.deepGreen.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(
                    color: AppColors.darkPrimary.withValues(alpha: 0.5),
                  ),
                ),
                child: Text(
                  AppStrings.active.tr,
                  style: context.labelSmall.copyWith(
                    color: AppColors.darkPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Gap(24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.regenerationsUsed.tr,
                    style: context.bodySmall.copyWith(
                      color: AppColors.darkSecondaryText,
                    ),
                  ),
                  Gap(8.h),
                  Row(
                    children: List.generate(
                      3,
                      (index) => Container(
                        margin: EdgeInsets.only(right: 6.w),
                        width: 24.w,
                        height: 4.h,
                        decoration: BoxDecoration(
                          color: index < 0 // Assuming 0 used for now
                              ? AppColors.darkPrimary
                              : AppColors.darkBorder,
                          borderRadius: BorderRadius.circular(2.r),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                  decoration: BoxDecoration(
                    color: AppColors.deepOrange.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(
                      color: AppColors.orangeAccent.withValues(alpha: 0.5),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.refresh,
                        color: AppColors.orangeAccent,
                        size: 16.r,
                      ),
                      Gap(8.w),
                      Text(
                        AppStrings.regenerate.tr,
                        style: context.bodySmall.copyWith(
                          color: AppColors.orangeAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
