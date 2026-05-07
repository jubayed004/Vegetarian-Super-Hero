import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:vegetarian_super_hero/features/dashboard/widgets/adherence_card.dart';
import 'package:vegetarian_super_hero/features/dashboard/widgets/daily_tracking_section.dart';
import 'package:vegetarian_super_hero/features/dashboard/widgets/dashboard_header.dart';
import 'package:vegetarian_super_hero/features/dashboard/widgets/stat_card.dart';
import 'package:vegetarian_super_hero/features/dashboard/widgets/today_meals_section.dart';
import 'package:vegetarian_super_hero/features/dashboard/widgets/today_workout_section.dart';
import 'package:vegetarian_super_hero/features/dashboard/widgets/weekly_check_in_banner.dart';
import 'package:vegetarian_super_hero/utils/app_strings/app_strings.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  Gap(20.h),
                  const DashboardHeader(),
                  Gap(24.h),
                  _buildTopStats(context),
                  Gap(24.h),
                  const WeeklyCheckInBanner(),
                  Gap(24.h),
                  const TodayWorkoutSection(),
                  Gap(24.h),
                  const TodayMealsSection(),
                  Gap(24.h),
                  const DailyTrackingSection(),
                  Gap(40.h),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopStats(BuildContext context) {
    return Row(
      children: [
        StatCard(
          title: AppStrings.weightSmall.tr,
          value: "84.3",
          unit: AppStrings.unitKg.tr,
        ),
        Gap(12.w),
        const AdherenceCard(score: "0/10", progress: 0.6),
        Gap(12.w),
        StatCard(
          title: AppStrings.caloriesSmall.tr,
          value: "2400",
          unit: "kcal",
          subtitle: AppStrings.dailyTarget.tr,
        ),
      ],
    );
  }
}
