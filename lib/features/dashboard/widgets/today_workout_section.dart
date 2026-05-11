import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:vegetarian_super_hero/share/widgets/button/custom_button.dart';
import 'package:vegetarian_super_hero/features/nav/controller/nav_controller.dart';
import 'package:vegetarian_super_hero/utils/app_strings/app_strings.dart';
import 'package:vegetarian_super_hero/utils/color/app_colors.dart';
import 'package:vegetarian_super_hero/utils/extension/base_extension.dart';

class TodayWorkoutSection extends StatelessWidget {
  const TodayWorkoutSection({super.key});

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
                    Icons.fitness_center_rounded,
                    size: 20.r,
                    color: AppColors.darkPrimary,
                  ),
                  Gap(8.w),
                  Text(
                    AppStrings.todaysWorkout.tr,
                    style: context.headlineSmall,
                  ),
                ],
              ),
              Text(AppStrings.monday.tr, style: context.bodySmall),
            ],
          ),
          Gap(12.h),
          const Divider(color: AppColors.dividerGrey, thickness: 0.5),
          Gap(20.h),
          Text("PUSH", style: context.headlineMedium),
          Gap(4.h),
          Text(
            "5 ${AppStrings.exercises.tr} · 65 ${AppStrings.min.tr}",
            style: context.bodyMedium,
          ),
          Gap(20.h),
          _buildExerciseItem(context, "Bench Press — 4×8-12"),
          _buildExerciseItem(context, "Overhead Press — 4×8-12"),
          _buildExerciseItem(context, "Incline DB Press — 3×10-15"),
          Gap(4.h),
          Text("+2 more", style: context.bodyMedium),
          Gap(24.h),
          CustomButton(
            text: "Start Workout",
            icon: Icons.fitness_center_rounded,
            onTap: () {
              NavController.to.changeIndex(1);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildExerciseItem(BuildContext context, String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Row(
        children: [
          Container(
            height: 8.r,
            width: 8.r,
            decoration: const BoxDecoration(
              color: AppColors.darkPrimary,
              shape: BoxShape.circle,
            ),
          ),
          Gap(12.w),
          Text(
            text,
            style: context.bodyMedium.copyWith(
              color: AppColors.textGreyLight,
              fontSize: 15.sp,
            ),
          ),
        ],
      ),
    );
  }
}
