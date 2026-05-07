import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:vegetarian_super_hero/utils/app_strings/app_strings.dart';
import 'package:vegetarian_super_hero/utils/color/app_colors.dart';
import 'package:vegetarian_super_hero/utils/extension/base_extension.dart';

class TodayMealsSection extends StatelessWidget {
  const TodayMealsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: AppColors.surfaceDeep,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.dividerGrey.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.restaurant_menu_rounded,
                    color: AppColors.yellowAccent.withValues(alpha: 0.8),
                    size: 22.r,
                  ),
                  Gap(10.w),
                  Text(
                    AppStrings.todaysMeals.tr,
                    style: context.titleMedium.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                    ),
                  ),
                ],
              ),
              Text(
                AppStrings.monday.tr,
                style: context.bodySmall.copyWith(
                  color: AppColors.textGrey.withValues(alpha: 0.6),
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
          Gap(20.h),
          Row(
            children: [
              _buildMacroItem(context, "180G", "P", AppColors.greenAccent),
              Gap(10.w),
              _buildMacroItem(context, "280G", "C", AppColors.yellowAccent),
              Gap(10.w),
              _buildMacroItem(context, "65G", "F", AppColors.orangeAccent),
            ],
          ),
          Gap(24.h),
          _buildMealRow(context, "7:00", "Breakfast", "520 kcal"),
          _buildMealRow(context, "10:30", "Mid-Morning", "310 kcal"),
          _buildMealRow(context, "1:00", "Lunch", "680 kcal"),
          _buildMealRow(context, "4:30", "Pre-Workout", "350 kcal"),
          _buildMealRow(context, "7:30", "Dinner", "540 kcal"),
        ],
      ),
    );
  }

  Widget _buildMacroItem(
    BuildContext context,
    String value,
    String label,
    Color color,
  ) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14.h),
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: AppColors.dividerGrey.withValues(alpha: 0.1),
          ),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: context.titleMedium.copyWith(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
              ),
            ),
            Gap(4.h),
            Text(
              label,
              style: context.bodySmall.copyWith(
                color: AppColors.textGrey.withValues(alpha: 0.6),
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMealRow(
    BuildContext context,
    String time,
    String name,
    String cals,
  ) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        children: [
          SizedBox(
            width: 50.w,
            child: Text(time, style: context.bodySmall),
          ),
          Gap(8.w),
          Container(
            height: 10.r,
            width: 10.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.dividerGrey.withValues(alpha: 0.3),
                width: 1.5,
              ),
            ),
          ),
          Gap(16.w),
          Expanded(
            child: Text(
              name,
              style: context.bodyMedium.copyWith(color: Colors.white),
            ),
          ),
          Text(
            cals,
            style: context.bodySmall.copyWith(color: AppColors.textGrey),
          ),
        ],
      ),
    );
  }
}
