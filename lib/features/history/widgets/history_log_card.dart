import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:vegetarian_super_hero/utils/app_strings/app_strings.dart';
import 'package:vegetarian_super_hero/utils/color/app_colors.dart';
import 'package:vegetarian_super_hero/utils/extension/base_extension.dart';

class HistoryLogCard extends StatelessWidget {
  final String date;
  final String weight;
  final String energy;
  final String note;
  final String status;

  const HistoryLogCard({
    super.key,
    required this.date,
    required this.weight,
    required this.energy,
    required this.note,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.darkSurface,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.darkBorder, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                date.toUpperCase(),
                style: context.bodyMedium.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
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
                      Icons.check_box,
                      color: AppColors.darkPrimary,
                      size: 14.r,
                    ),
                    Gap(6.w),
                    Text(
                      status,
                      style: context.labelSmall.copyWith(
                        color: AppColors.darkPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Gap(8.h),
          Text(
            "$weight · ${AppStrings.energy.tr} $energy",
            style: context.bodySmall.copyWith(
              color: AppColors.darkSecondaryText,
            ),
          ),
          Gap(16.h),
          Text(
            note,
            style: context.bodyMedium.copyWith(
              color: AppColors.darkSecondaryText,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
