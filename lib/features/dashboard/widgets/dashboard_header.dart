import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vegetarian_super_hero/utils/app_strings/app_strings.dart';
import 'package:vegetarian_super_hero/utils/color/app_colors.dart';
import 'package:get/get.dart';
import 'package:vegetarian_super_hero/utils/extension/base_extension.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(AppStrings.goodMorning.tr, style: context.bodyMedium),
                Text(" 👋", style: TextStyle(fontSize: 16.sp)),
              ],
            ),
            Text("ABHIK PATEL", style: context.headlineLarge),
          ],
        ),
        Container(
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.dividerGrey.withValues(alpha: 0.3),
            ),
            color: AppColors.surfaceDeep,
          ),
          child: Icon(
            Icons.notifications_none_rounded,
            color: Colors.white,
            size: 24.r,
          ),
        ),
      ],
    );
  }
}
