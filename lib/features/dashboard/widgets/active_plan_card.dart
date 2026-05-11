import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:vegetarian_super_hero/utils/app_strings/app_strings.dart';
import 'package:vegetarian_super_hero/utils/color/app_colors.dart';
import 'package:vegetarian_super_hero/utils/extension/base_extension.dart';

class ActivePlanCard extends StatelessWidget {
  const ActivePlanCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF1B2E15),
            AppColors.surfaceDeep,
          ],
        ),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: AppColors.darkPrimary.withValues(alpha: 0.2),
          width: 1.r,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: context.bodySmall.copyWith(
                        color: AppColors.darkPrimary,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                        fontSize: 12.sp,
                      ),
                      children: [
                        const TextSpan(text: "ACTIVE PLAN "),
                        TextSpan(
                          text: "v1",
                          style: TextStyle(
                            color: AppColors.darkPrimary.withValues(alpha: 0.7),
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(2.h),
                  Text(
                    AppStrings.muscleGain.tr.toUpperCase(),
                    style: context.headlineMedium.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 26.sp,
                      letterSpacing: -0.5,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(10.r),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.darkPrimary.withValues(alpha: 0.3),
                    width: 1.5,
                  ),
                  color: AppColors.darkPrimary.withValues(alpha: 0.05),
                ),
                child: Icon(
                  Icons.bolt_rounded,
                  color: AppColors.darkPrimary,
                  size: 24.r,
                ),
              ),
            ],
          ),
          Gap(20.h),
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: _buildSubStat(
                    icon: Icons.fitness_center_rounded,
                    iconColor: AppColors.darkPrimary,
                    value: "Push / Pull /\nLegs",
                    label: "Split",
                  ),
                ),
                Gap(10.w),
                Expanded(
                  child: _buildSubStat(
                    icon: Icons.calendar_today_rounded,
                    iconColor: AppColors.yellowAccent,
                    value: "3 days/wk",
                    label: "Training",
                  ),
                ),
                Gap(10.w),
                Expanded(
                  child: _buildSubStat(
                    icon: Icons.local_fire_department_rounded,
                    iconColor: AppColors.orangeAccent,
                    value: "2400 kcal",
                    label: "Daily target",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubStat({
    required IconData icon,
    required Color iconColor,
    required String value,
    required String label,
  }) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: iconColor, size: 16.r),
          Gap(12.h),
          Text(
            value,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              height: 1.2,
            ),
          ),
          const Spacer(),
          Gap(4.h),
          Text(
            label,
            style: TextStyle(
              color: AppColors.textGrey,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}
