import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:vegetarian_super_hero/features/activate_plan/widgets/progress_step_item.dart';
import 'package:vegetarian_super_hero/utils/app_strings/app_strings.dart';
import 'package:vegetarian_super_hero/utils/color/app_colors.dart';
import 'package:vegetarian_super_hero/utils/extension/base_extension.dart';

class BuildingProgressView extends StatelessWidget {
  final int progress;
  final bool isTransition;
  final int stepIndex;
  final List<String> steps;
  final Animation<double> scaleAnimation;

  const BuildingProgressView({
    super.key,
    required this.progress,
    required this.isTransition,
    required this.stepIndex,
    required this.steps,
    required this.scaleAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Gap(56.h),
              // Circular Progress
              ScaleTransition(
                scale: isTransition ? scaleAnimation : const AlwaysStoppedAnimation(1.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 200.r,
                      height: 200.r,
                      child: CircularProgressIndicator(
                        value: progress / 100,
                        strokeWidth: 12.r,
                        backgroundColor: const Color(0xFF1E1E1E),
                        color: AppColors.darkPrimary,
                      ),
                    ),
                    Text(
                      "$progress%",
                      style: context.headlineLarge.copyWith(
                        color: Colors.white,
                        fontSize: 48.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Gap(60.h),
              ScaleTransition(
                scale: isTransition ? scaleAnimation : const AlwaysStoppedAnimation(1.0),
                child: Text(
                  progress == 100
                      ? AppStrings.yourPlanIsReadyCaps.tr
                      : AppStrings.buildingYourSystem.tr,
                  textAlign: TextAlign.center,
                  style: context.headlineSmall.copyWith(
                    color: Colors.white,
             
                    fontSize: 28.sp,
                  ),
                ),
              ),
              Gap(16.h),
              AnimatedOpacity(
                opacity: isTransition ? 0.0 : 1.0,
                duration: const Duration(milliseconds: 300),
                child: Text(
                  steps[stepIndex].tr + "...",
                  style: context.bodyMedium.copyWith(
                    color: AppColors.darkPrimary,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              Gap(40.h),
              // Steps List
              if (!isTransition)
                ...List.generate(steps.length, (index) {
                  bool isDone = index < stepIndex || progress == 100;
                  bool isCurrent = index == stepIndex && progress < 100;

                  return ProgressStepItem(
                    text: steps[index],
                    isDone: isDone,
                    isCurrent: isCurrent,
                  );
                }),
            ],
          ),
        ),
      ),
    );
  }
}
