import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:vegetarian_super_hero/utils/color/app_colors.dart';
import 'package:vegetarian_super_hero/utils/extension/base_extension.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final String unit;
  final String? subtitle;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.unit,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
        decoration: BoxDecoration(
          color: AppColors.surfaceDeep,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: AppColors.dividerGrey.withValues(alpha: 0.2),
          ),
        ),
        child: Column(
          children: [
            Text(title, style: context.bodySmall),
            Gap(8.h),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    value,
                    style: context.headlineMedium.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gap(4.w),
                  Text(
                    unit,
                    style: context.bodySmall.copyWith(color: AppColors.textGrey, fontSize: 10.sp),
                  ),
                ],
              ),
            ),
            if (subtitle != null) ...[
              Gap(4.h),
              Text(
                subtitle!,
                style: context.bodySmall.copyWith(color: AppColors.darkPrimary),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
