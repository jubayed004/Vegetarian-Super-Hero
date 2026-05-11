import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:vegetarian_super_hero/utils/app_strings/app_strings.dart';
import 'package:vegetarian_super_hero/utils/color/app_colors.dart';
import 'package:vegetarian_super_hero/utils/extension/base_extension.dart';
import '../../../share/widgets/custom_buttom_sheet/custom_buttom_sheet.dart';

class MealSection extends StatelessWidget {
  final String title;
  final String time;
  final String calories;
  final List<Widget> items;

  const MealSection({
    super.key,
    required this.title,
    required this.time,
    required this.calories,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.darkSurface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.darkBorder.withValues(alpha: 0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "$title - $time",
                style: context.titleMedium.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    calories,
                    style: context.titleMedium.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkPrimary,
                    ),
                  ),
                  Text(
                    "kcal",
                    style: context.labelSmall.copyWith(
                      color: AppColors.darkSecondaryText,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Divider(color: AppColors.darkBorder, height: 24.h),
          Column(children: items),
        ],
      ),
    );
  }
}

class FoodItemTile extends StatelessWidget {
  final String name;
  final String quantity;
  final String cals;
  final String macro;
  final String macroType; // protein, carb, fat

  const FoodItemTile({
    super.key,
    required this.name,
    required this.quantity,
    required this.cals,
    required this.macro,
    required this.macroType,
  });

  @override
  Widget build(BuildContext context) {
    Color macroColor = AppColors.darkPrimary;
    if (macroType == "carb") macroColor = AppColors.yellowAccent;
    if (macroType == "fat") macroColor = AppColors.orangeAccent;

    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: context.bodyMedium.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                ),
                Text(
                  "$quantity - $cals kcal - $macro",
                  style: context.bodySmall.copyWith(
                    color: AppColors.darkSecondaryText,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: macroColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(4.r),
              border: Border.all(color: macroColor.withValues(alpha: 0.3)),
            ),
            child: Text(
              macroType,
              style: TextStyle(color: macroColor, fontSize: 10.sp, fontWeight: FontWeight.bold),
            ),
          ),
          Gap(12.w),
          GestureDetector(
            onTap: () => showSwapMealModal(context, name),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: AppColors.darkPrimary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(4.r),
                border: Border.all(
                    color: AppColors.darkPrimary.withValues(alpha: 0.3)),
              ),
              child: Row(
                children: [
                  Icon(Icons.refresh, color: AppColors.darkPrimary, size: 12.r),
                  Gap(4.w),
                  Text(
                    AppStrings.swap.tr,
                    style: context.labelSmall.copyWith(
                      color: AppColors.darkPrimary,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
