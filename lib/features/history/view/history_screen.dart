import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:vegetarian_super_hero/share/widgets/button/custom_button.dart';
import 'package:vegetarian_super_hero/share/widgets/custom_buttom_sheet/custom_buttom_sheet.dart';
import 'package:vegetarian_super_hero/utils/color/app_colors.dart';
import 'package:vegetarian_super_hero/utils/extension/base_extension.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Custom App Bar
          SliverAppBar(
            floating: true,
            pinned: false,
            centerTitle: false,
            title: Text(
              "HISTORY",
              style: context.headlineMedium.copyWith(
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
                color: AppColors.white,
              ),
            ),
          ),

          // Main Content
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _buildCurrentPlanCard(context),
                Gap(16.h),
                _buildRegenerationsCard(context),
                Gap(16.h),
                _buildWhatRegenerationDoesCard(context),
                Gap(32.h),
                _buildRegenerationActionSection(context),
                Gap(40.h),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentPlanCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: const Color(0xFF111711),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: AppColors.darkPrimary.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "CURRENT PLAN",
                    style: context.labelSmall.copyWith(
                      color: AppColors.darkPrimary,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.2,
                    ),
                  ),
                  Gap(4.h),
                  Text(
                    "MUSCLE GAIN — V1",
                    style: context.titleLarge.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: const Color(0xFF1B2E15),
                  borderRadius: BorderRadius.circular(4.r),
                  border: Border.all(
                    color: AppColors.darkPrimary.withValues(alpha: 0.3),
                  ),
                ),
                child: Text(
                  "Active",
                  style: context.labelSmall.copyWith(
                    color: AppColors.darkPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Gap(20.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _buildInfoBlock(context, "PUSH / PULL /\nLEGS", "Split"),
              ),
              Gap(12.w),
              Expanded(
                child: _buildInfoBlock(context, "3 DAYS/WK", "Training"),
              ),
              Gap(12.w),
              Expanded(
                child: _buildInfoBlock(context, "2400 KCAL", "Calories"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoBlock(BuildContext context, String title, String subtitle) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: const Color(0xFF0A0A0A),
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: context.labelLarge.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.bold,
              height: 1.3,
            ),
          ),
          Gap(12.h),
          Text(
            subtitle,
            style: context.labelSmall.copyWith(
              color: AppColors.darkSecondaryText,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRegenerationsCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: const Color(0xFF111111),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: const Color(0xFF252525), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Regenerations this cycle",
                style: context.bodyMedium.copyWith(
                  color: AppColors.white.withValues(alpha: 0.9),
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "0 / 3",
                style: context.bodyLarge.copyWith(
                  color: AppColors.yellowAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Gap(16.h),
          Row(
            children: List.generate(
              3,
              (index) => Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: index < 2 ? 8.w : 0),
                  height: 6.h,
                  decoration: BoxDecoration(
                    color: const Color(0xFF666666).withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(3.r),
                  ),
                ),
              ),
            ),
          ),
          Gap(12.h),
          Text(
            "3 remaining — resets on next billing date",
            style: context.labelMedium.copyWith(
              color: AppColors.darkSecondaryText,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWhatRegenerationDoesCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: const Color(0xFF111111),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: const Color(0xFF252525), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "WHAT REGENERATION DOES",
            style: context.labelMedium.copyWith(
              color: AppColors.darkSecondaryText,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.0,
            ),
          ),
          Gap(20.h),
          _buildFeatureRow(
            context,
            iconText: "🥗",
            bgColor: const Color(0xFF2A3B2A),
            title: "New Nutrition Plan",
            subtitle: "Recalculated macros, meal schedule and food selections",
          ),
          Gap(24.h),
          _buildFeatureRow(
            context,
            iconText: "🏆",
            bgColor: const Color(0xFF2E2E1A),
            title: "New Training Program",
            subtitle: "Fresh exercises, rep ranges and workout structure",
          ),
          Gap(24.h),
          _buildFeatureRow(
            context,
            iconText: "🤖",
            bgColor: const Color(0xFF1A2A3A),
            title: "AI Re-analysis",
            subtitle: "VSS re-evaluates your goals and builds from scratch",
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureRow(
    BuildContext context, {
    required String iconText,
    required Color bgColor,
    required String title,
    required String subtitle,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 36.w,
          height: 36.w,
          decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
          alignment: Alignment.center,
          child: Text(iconText, style: TextStyle(fontSize: 16.sp)),
        ),
        Gap(16.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: context.bodyMedium.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gap(4.h),
              Text(
                subtitle,
                style: context.bodySmall.copyWith(
                  color: AppColors.darkSecondaryText,
                  height: 1.3,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRegenerationActionSection(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomButton(
          icon: Icons.refresh_rounded,
          onTap: () => showRegeneratePlanModal(context),
          text: "Regeneration My Plan",
        ),
        Gap(12.h),
        Text(
          "Your current plan will be replaced immediately. This\naction cannot be undone.",
          textAlign: TextAlign.center,
          style: context.labelSmall,
        ),
      ],
    );
  }
}
