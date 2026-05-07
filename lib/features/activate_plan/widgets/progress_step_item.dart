import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:vegetarian_super_hero/utils/color/app_colors.dart';
import 'package:vegetarian_super_hero/utils/extension/base_extension.dart';

class ProgressStepItem extends StatelessWidget {
  final String text;
  final bool isDone;
  final bool isCurrent;

  const ProgressStepItem({
    super.key,
    required this.text,
    required this.isDone,
    required this.isCurrent,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 12.h,
        ),
        decoration: BoxDecoration(
          color: isCurrent
              ? AppColors.darkPrimary.withValues(alpha: 0.1)
              : const Color(0xFF1E1E1E).withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isCurrent ? AppColors.darkPrimary : Colors.transparent,
            width: 1.w,
          ),
        ),
        child: Row(
          children: [
            Icon(
              isDone
                  ? Icons.check_circle
                  : (isCurrent ? Icons.radio_button_checked : Icons.radio_button_off),
              color: isDone || isCurrent ? AppColors.darkPrimary : const Color(0xFF444444),
              size: 20.r,
            ),
            Gap(12.w),
            Text(
              text.tr,
              style: context.bodyMedium.copyWith(
                color: isDone || isCurrent ? Colors.white : const Color(0xFF666666),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
