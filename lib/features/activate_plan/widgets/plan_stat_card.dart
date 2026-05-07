import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:vegetarian_super_hero/utils/color/app_colors.dart';
import 'package:vegetarian_super_hero/utils/extension/base_extension.dart';

class PlanStatCard extends StatelessWidget {
  final String title;
  final String value;
  final bool isOrange;
  final String? subtitle;

  const PlanStatCard({
    super.key,
    required this.title,
    required this.value,
    this.isOrange = false,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    Color themeColor = isOrange
        ? const Color(0xFFFF5722)
        : AppColors.darkPrimary;
    IconData iconData = Icons.track_changes;

    if (title.contains("CALORIES")) {
      iconData = Icons.local_fire_department;
      themeColor = const Color(0xFFFF5722);
    } else if (title.contains("GOAL")) {
      iconData = Icons.track_changes;
      themeColor = const Color(0xFF7CFF01);
    } else if (title.contains("SPLIT")) {
      iconData = Icons.fitness_center;
      themeColor = const Color(0xFFE5B100);
    } else if (title.contains("DAYS")) {
      iconData = Icons.bolt;
      themeColor = const Color(0xFF5D7BFF);
    }

    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: const Color(0xFF121212),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFF1E1E1E), width: 1.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(iconData, color: themeColor, size: 20.r),
          Gap(8.h),
          Text(title, style: context.bodyMedium),
          Gap(4.h),
          Text(
            value,
            style: context.headlineMedium.copyWith(color: themeColor),
          ),
          if (subtitle != null) ...[
            Gap(4.h),
            Text(subtitle!, style: context.bodySmall),
          ],
        ],
      ),
    );
  }
}
