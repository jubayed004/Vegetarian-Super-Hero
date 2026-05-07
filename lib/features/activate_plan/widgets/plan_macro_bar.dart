import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:vegetarian_super_hero/utils/extension/base_extension.dart';

class PlanMacroBar extends StatelessWidget {
  final String label;
  final String value;
  final double progress;
  final Color color;

  const PlanMacroBar({
    super.key,
    required this.label,
    required this.value,
    required this.progress,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(value, style: context.headlineMedium.copyWith(color: color)),
        Gap(4.h),
        Text(label, style: context.bodySmall),
        Gap(8.h),
        Stack(
          children: [
            Container(
              height: 4.h,
              width: 60.w,
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
            Container(
              height: 4.h,
              width: 60.w * progress,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
