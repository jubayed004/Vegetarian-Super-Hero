import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:vegetarian_super_hero/core/custom_assets/assets.gen.dart';
import 'package:vegetarian_super_hero/core/router/route_path.dart';
import 'package:vegetarian_super_hero/core/router/routes.dart';
import 'package:vegetarian_super_hero/features/activate_plan/widgets/plan_macro_bar.dart';
import 'package:vegetarian_super_hero/features/activate_plan/widgets/plan_meal_row.dart';
import 'package:vegetarian_super_hero/features/activate_plan/widgets/plan_stat_card.dart';
import 'package:vegetarian_super_hero/share/widgets/button/custom_button.dart';
import 'package:vegetarian_super_hero/utils/app_strings/app_strings.dart';
import 'package:vegetarian_super_hero/utils/extension/base_extension.dart';

class FinalPlanView extends StatelessWidget {
  const FinalPlanView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
        child: Column(
          children: [
            // Top Icon with Glow
            Container(
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF7CFC00).withValues(alpha: 0.2),
                    blurRadius: 20.r,
                    spreadRadius: 2.r,
                  ),
                ],
              ),
              child: Assets.images.flash.image(
                width: 50.r,
                height: 50.r,
                fit: BoxFit.contain,
              ),
            ),
            Gap(20.h),
            Text(
              AppStrings.yourPlanIsReadyCaps.tr,
              style: context.headlineLarge.copyWith(
                color: Colors.white,

                letterSpacing: 1.0,
              ),
            ),
            Gap(8.h),
            Text(
              AppStrings.builtSpecificallyForYou.tr,
              style: context.bodyLarge,
            ),
            Gap(32.h),
            // Stats Grid
            Row(
              children: [
                Expanded(
                  child: PlanStatCard(
                    title: AppStrings.dailyCalories.tr,
                    value: "2400",
                    isOrange: true,
                  ),
                ),
                Gap(12.w),
                Expanded(
                  child: PlanStatCard(
                    title: AppStrings.yourGoalTitle.tr,
                    value: "MUSCLE GAIN",
                  ),
                ),
              ],
            ),
            Gap(12.h),
            Row(
              children: [
                Expanded(
                  child: PlanStatCard(
                    title: AppStrings.trainingSplit.tr,
                    value: "PUSH / PULL / LEGS",
                  ),
                ),
                Gap(12.w),
                Expanded(
                  child: PlanStatCard(
                    title: AppStrings.trainingDays.tr,
                    value: "03",
                    subtitle: "days/week",
                  ),
                ),
              ],
            ),
            Gap(24.h),
            // Daily Macros
            Container(
              padding: EdgeInsets.all(20.r),
              decoration: BoxDecoration(
                color: const Color(0xFF121212),
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: const Color(0xFF1E1E1E), width: 1.w),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.dailyMacros.tr,
                    style: context.labelLarge.copyWith(color: Colors.white),
                  ),
                  Gap(20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: PlanMacroBar(
                          label: AppStrings.protein.tr,
                          value: "180G",
                          progress: 0.7,
                          color: const Color(0xFF7CFF01),
                        ),
                      ),
                      Container(
                        height: 40.h,
                        width: 1.w,
                        color: const Color(0xFF1E1E1E),
                        margin: EdgeInsets.symmetric(horizontal: 10.w),
                      ),
                      Expanded(
                        child: PlanMacroBar(
                          label: AppStrings.carbs.tr,
                          value: "280G",
                          progress: 0.8,
                          color: const Color(0xFFE5B100),
                        ),
                      ),
                      Container(
                        height: 40.h,
                        width: 1.w,
                        color: const Color(0xFF1E1E1E),
                        margin: EdgeInsets.symmetric(horizontal: 10.w),
                      ),
                      Expanded(
                        child: PlanMacroBar(
                          label: AppStrings.fat.tr,
                          value: "65G",
                          progress: 0.4,
                          color: const Color(0xFFFF5722),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Gap(24.h),
            // Meal Plan
            Container(
              padding: EdgeInsets.all(20.r),
              decoration: BoxDecoration(
                color: const Color(0xFF121212),
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: const Color(0xFF1E1E1E), width: 1.w),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Meal Plan — 5 meals/day",
                    style: context.labelLarge.copyWith(color: Colors.white),
                  ),
                  Gap(20.h),
                  const PlanMealRow(
                    title: "7:00 AM — Breakfast",
                    calories: "520 kcal",
                  ),
                  const PlanMealRow(
                    title: "10:30 AM — Mid-Morning",
                    calories: "310 kcal",
                  ),
                  const PlanMealRow(
                    title: "1:00 PM — Lunch",
                    calories: "680 kcal",
                  ),
                  Gap(8.h),
                  Text("+ 2 more meals...", style: context.bodySmall),
                ],
              ),
            ),
            Gap(40.h),
            CustomButton(text: AppStrings.activateMyPlan.tr, onTap: () {AppRouter.route.go(RoutePath.navScreen);}),
            Gap(12.h),
            Text(
              AppStrings.thisWillStartYourTransformationJourney.tr,
              style: context.bodySmall,
            ),
            Gap(20.h),
          ],
        ),
      ),
    );
  }
}
