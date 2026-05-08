import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:vegetarian_super_hero/utils/color/app_colors.dart';
import 'package:vegetarian_super_hero/utils/extension/base_extension.dart';

class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool isLast;

  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: isLast
          ? BorderRadius.vertical(bottom: Radius.circular(12.r))
          : null,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Row(
              children: [
                Icon(icon, color: AppColors.white, size: 20.r),
                Gap(16.w),
                Expanded(child: Text(title, style: context.bodyLarge)),
                Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.darkSecondaryText.withValues(alpha: 0.5),
                  size: 14.r,
                ),
              ],
            ),
          ),
          if (!isLast)
            Divider(
              color: AppColors.darkBorder.withValues(alpha: 0.5),
              height: 1.h,
              indent: 52.w,
              endIndent: 16.w,
            ),
        ],
      ),
    );
  }
}
