import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:vegetarian_super_hero/utils/color/app_colors.dart';
import 'package:vegetarian_super_hero/utils/extension/base_extension.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color? titleColor;

  const StatCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.darkSurface.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: AppColors.darkBorder.withValues(alpha: 0.5),
          width: 1.w,
        ),
      ),
      child: Column(
        children: [
          Text(title, style: context.titleLarge.copyWith(color: titleColor)),
          Gap(4.h),
          Text(subtitle, style: context.labelSmall),
        ],
      ),
    );
  }
}
