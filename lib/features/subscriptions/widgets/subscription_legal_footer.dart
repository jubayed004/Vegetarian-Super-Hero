import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:vegetarian_super_hero/utils/app_strings/app_strings.dart';
import 'package:vegetarian_super_hero/utils/color/app_colors.dart';
import 'package:vegetarian_super_hero/utils/extension/base_extension.dart';

class SubscriptionLegalFooter extends StatelessWidget {
  const SubscriptionLegalFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            // Navigate to Terms
          },
          child: Text(
            AppStrings.termsAndConditions.tr,
            style: context.bodySmall.copyWith(
              color: AppColors.primaryText,
              fontSize: 12.sp,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Text(
            "|",
            style: TextStyle(color: AppColors.primaryText, fontSize: 12.sp),
          ),
        ),
        GestureDetector(
          onTap: () {
            // Navigate to Privacy
          },
          child: Text(
            AppStrings.privacyPolicy.tr,
            style: context.bodySmall.copyWith(
              color: AppColors.primaryText,
              fontSize: 12.sp,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
