import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:vegetarian_super_hero/utils/app_strings/app_strings.dart';
import 'package:vegetarian_super_hero/utils/color/app_colors.dart';
import 'package:vegetarian_super_hero/utils/extension/base_extension.dart';
import '../widgets/current_plan_card.dart';
import '../widgets/history_log_card.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: Text(
          AppStrings.history.tr,
          style: context.headlineMedium.copyWith(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: AppColors.deepGreen.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(
                    color: AppColors.darkPrimary.withValues(alpha: 0.5),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.assignment_turned_in,
                      color: AppColors.darkPrimary,
                      size: 18.r,
                    ),
                    Gap(8.w),
                    Text(
                      AppStrings.checkIn.tr,
                      style: context.bodySmall.copyWith(
                        color: AppColors.darkPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          children: [
            const CurrentPlanCard(),
            Gap(24.h),
            HistoryLogCard(
              date: "Apr 28, 2026",
              weight: "83.3kg",
              energy: "8/10",
              note: "On track. Keep this momentum going.",
              status: AppStrings.maintainPlan.tr,
            ),
            HistoryLogCard(
              date: "Apr 21, 2026",
              weight: "82.8kg",
              energy: "8/10",
              note: "Excellent adherence. Maintain current plan.",
              status: AppStrings.maintainPlan.tr,
            ),
            HistoryLogCard(
              date: "Apr 14, 2026",
              weight: "82.2kg",
              energy: "7/10",
              note: "Keep going — solid progress detected.",
              status: AppStrings.maintainPlan.tr,
            ),
          ],
        ),
      ),
    );
  }
}
