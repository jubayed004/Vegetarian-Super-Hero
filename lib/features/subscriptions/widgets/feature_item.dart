import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:vegetarian_super_hero/utils/color/app_colors.dart';
import 'package:vegetarian_super_hero/utils/extension/base_extension.dart';

class FeatureItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const FeatureItem({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(8.r),
            decoration: const BoxDecoration(
              color: AppColors.badgeSuccessBg,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColors.darkPrimary, size: 20.r),
          ),
          Gap(16.w),
          Expanded(
            child: Text(
              text,
              style: context.bodyLarge.copyWith(
                color: AppColors.textOffWhite,
                fontSize: 16.sp,
              ),
            ),
          ),
          Icon(
            Icons.check_circle_outline,
            color: AppColors.darkPrimary,
            size: 18.r,
          ),
        ],
      ),
    );
  }
}
