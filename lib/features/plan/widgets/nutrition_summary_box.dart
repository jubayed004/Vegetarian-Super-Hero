import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:vegetarian_super_hero/utils/app_strings/app_strings.dart';
import 'package:vegetarian_super_hero/utils/color/app_colors.dart';
import 'package:vegetarian_super_hero/utils/extension/base_extension.dart';

class NutritionSummaryBox extends StatelessWidget {
  const NutritionSummaryBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: AppColors.darkSurface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.darkBorder.withValues(alpha: 0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "2400 ${AppStrings.kcalPerDay.tr}",
            style: context.titleLarge.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.white,
              fontSize: 22.sp,
            ),
          ),
          Gap(16.h),
          Row(
            children: [
              _buildMacroBar(AppColors.darkPrimary, 0.4),
              Gap(8.w),
              _buildMacroBar(AppColors.yellowAccent, 0.5),
              Gap(8.w),
              _buildMacroBar(AppColors.orangeAccent, 0.2),
            ],
          ),
          Gap(16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildMacroLabel(
                AppColors.darkPrimary,
                AppStrings.protein.tr,
                "180g",
                context,
              ),
              _buildMacroLabel(
                AppColors.yellowAccent,
                AppStrings.carbs.tr,
                "280g",
                context,
              ),
              _buildMacroLabel(
                AppColors.orangeAccent,
                AppStrings.fat.tr,
                "65g",
                context,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMacroBar(Color color, double flex) {
    return Expanded(
      flex: (flex * 100).toInt(),
      child: Container(
        height: 10.h,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5.r),
        ),
      ),
    );
  }

  Widget _buildMacroLabel(
    Color color,
    String label,
    String value,
    BuildContext context,
  ) {
    return Row(
      children: [
        Container(
          width: 8.r,
          height: 8.r,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        Gap(6.w),
        Text("$label: $value", style: context.labelSmall),
      ],
    );
  }
}
