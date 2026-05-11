import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:vegetarian_super_hero/features/dashboard/widgets/active_plan_card.dart';
import 'package:vegetarian_super_hero/features/dashboard/widgets/nutrition_training_section.dart';
import 'package:vegetarian_super_hero/features/dashboard/widgets/regenerate_plan_card.dart';
import 'package:vegetarian_super_hero/features/dashboard/widgets/today_meals_section.dart';
import 'package:vegetarian_super_hero/features/dashboard/widgets/today_workout_section.dart';
import 'package:vegetarian_super_hero/utils/color/app_colors.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  Gap(20.h),
                  const ActivePlanCard(),
                  Gap(24.h),
                  const NutritionTrainingSection(),
                  Gap(24.h),
                  const TodayWorkoutSection(),
                  Gap(24.h),
                  const TodayMealsSection(),
                  Gap(24.h),
                  const RegeneratePlanCard(),
                  Gap(40.h),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
