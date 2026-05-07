import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:vegetarian_super_hero/utils/app_strings/app_strings.dart';
import 'package:vegetarian_super_hero/utils/color/app_colors.dart';
import 'package:vegetarian_super_hero/utils/extension/base_extension.dart';

class AdherenceCard extends StatelessWidget {
  final String score;
  final double progress;

  const AdherenceCard({super.key, required this.score, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        decoration: BoxDecoration(
          color: AppColors.surfaceDeep,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: AppColors.dividerGrey.withValues(alpha: 0.2),
          ),
        ),
        child: Column(
          children: [
            Text(AppStrings.adherence.tr, style: context.bodySmall),
            Gap(8.h),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 40.r,
                  width: 40.r,
                  child: CircularProgressIndicator(
                    value: progress,
                    strokeWidth: 4,
                    backgroundColor: AppColors.dividerGrey.withValues(
                      alpha: 0.2,
                    ),
                    color: AppColors.darkPrimary,
                  ),
                ),
                Text(
                  score,
                  style: context.bodySmall.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 10.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
