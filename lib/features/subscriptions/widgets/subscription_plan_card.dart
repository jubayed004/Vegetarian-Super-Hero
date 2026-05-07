import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:vegetarian_super_hero/utils/app_strings/app_strings.dart';
import 'package:vegetarian_super_hero/utils/color/app_colors.dart';
import 'package:vegetarian_super_hero/utils/extension/base_extension.dart';
import './feature_item.dart';

class SubscriptionPlanCard extends StatelessWidget {
  const SubscriptionPlanCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.r),
      decoration: BoxDecoration(
        color: AppColors.surfaceDeep,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(
          color: AppColors.goldAccent.withOpacity(0.6),
          width: 1.5.w,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.goldAccent.withOpacity(0.1),
            blurRadius: 40.r,
            spreadRadius: -10.r,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // MOST POPULAR Badge
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(
                color: AppColors.goldAccent.withOpacity(0.4),
                width: 1.w,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.star,
                  color: AppColors.goldAccent,
                  size: 14.r,
                ),
                Gap(6.w),
                Text(
                  AppStrings.mostPopular.tr,
                  style: context.labelSmall.copyWith(
                    color: AppColors.goldAccent,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
          ),
          Gap(16.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "\$150",
                style: context.headlineLarge.copyWith(
                  color: Colors.white,
                  fontSize: 64.sp,
                  height: 1.0,
                ),
              ),
              Gap(12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.perMonth.tr,
                    style: context.bodyLarge.copyWith(
                      color: AppColors.textGrey,
                      fontSize: 16.sp,
                    ),
                  ),
                  Text(
                    AppStrings.cancelAnytimeYellow.tr,
                    style: context.bodyMedium.copyWith(
                      color: AppColors.yellowAccent,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Gap(32.h),
          Text(
            AppStrings.trialInfo.tr,
            style: context.bodySmall.copyWith(
              color: const Color(0xFF666666),
              fontSize: 14.sp,
            ),
          ),
          Gap(32.h),
          // Features List
          FeatureItem(icon: Icons.bolt, text: AppStrings.aiBuiltPersonalizedNutritionPlan.tr),
          FeatureItem(icon: Icons.refresh, text: AppStrings.weeklyAdaptivePlanAdjustments.tr),
          FeatureItem(icon: Icons.eco, text: AppStrings.pushPullLegsCustomTraining.tr),
          FeatureItem(icon: Icons.chat_bubble_outline, text: AppStrings.coachingGradeWeeklyFeedbackSystem.tr),
          FeatureItem(icon: Icons.refresh, text: AppStrings.upTo3AiPlanRegenerations.tr),
          FeatureItem(icon: Icons.star_border, text: AppStrings.prioritySupportNewFeatureAccess.tr),
        ],
      ),
    );
  }
}
