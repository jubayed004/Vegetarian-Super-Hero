import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:vegetarian_super_hero/utils/app_strings/app_strings.dart';
import 'package:vegetarian_super_hero/utils/color/app_colors.dart';
import 'package:vegetarian_super_hero/utils/extension/base_extension.dart';

class WeeklyCheckInBanner extends StatelessWidget {
  const WeeklyCheckInBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A10),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: AppColors.yellowAccent.withValues(alpha: 0.15),
          width: 1,
        ),
      ),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Clipboard Icon Container
              Container(
                padding: EdgeInsets.all(10.r),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.03),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(
                  Icons.assignment_outlined,
                  color: AppColors.yellowAccent,
                  size: 24.r,
                ),
              ),
              Gap(12.w),
              // Text Content
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.weeklyCheckInDue.tr.toUpperCase(),
                      style: context.titleMedium.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 14.sp,
                        letterSpacing: 0.5,
                      ),
                    ),
                    Gap(4.h),
                    Padding(
                      padding: EdgeInsets.only(
                        right: 90.w,
                      ), // Increased space for the button
                      child: Text(
                        AppStrings.logYourProgressForSystemAdjustment.tr,
                        style: context.bodySmall.copyWith(
                          color: AppColors.textGrey,
                          fontSize: 11.sp,
                          height: 1.3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Close Icon - Top Right (Moved slightly inside)
          Positioned(
            right: 0,
            top: -4.h,
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.close,
                color: AppColors.textGrey.withValues(alpha: 0.5),
                size: 18.r,
              ),
            ),
          ),
          // Check In Button - Bottom Right (Moved slightly inside)
          Positioned(
            right: 0,
            bottom: 0,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.yellowAccent,
                foregroundColor: Colors.black,
                elevation: 0,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                minimumSize: Size(0, 44.h),
                visualDensity: VisualDensity.compact,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
              ),
              child: Text(
                AppStrings.checkIn.tr,
                style: context.bodySmall.copyWith(
                  color: AppColors.black,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
