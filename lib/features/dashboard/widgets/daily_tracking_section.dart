import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:vegetarian_super_hero/utils/app_strings/app_strings.dart';
import 'package:vegetarian_super_hero/utils/color/app_colors.dart';
import 'package:vegetarian_super_hero/utils/extension/base_extension.dart';

class DailyTrackingSection extends StatelessWidget {
  const DailyTrackingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: AppColors.surfaceDeep,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.dividerGrey.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.whatshot_rounded,
                color: AppColors.orangeAccent,
                size: 20.r,
              ),
              Gap(8.w),
              Text(AppStrings.dailyTracking.tr, style: context.titleMedium),
            ],
          ),
          Gap(20.h),
          TrackingToggle(title: AppStrings.proteinTargetHit.tr),
          TrackingToggle(title: AppStrings.workoutCompleted.tr),
          Gap(16.h),
          Row(
            children: [
              Text(AppStrings.todaysScore.tr, style: context.bodyMedium),
              Gap(12.w),
              Expanded(
                child: Row(
                  children: List.generate(
                    10,
                    (index) => Expanded(
                      child: Container(
                        height: 8.h,
                        margin: EdgeInsets.symmetric(horizontal: 2.w),
                        decoration: BoxDecoration(
                          color: AppColors.dividerGrey.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Gap(12.w),
              Text(
                "0/10",
                style: context.bodyMedium.copyWith(
                  color: AppColors.darkPrimary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TrackingToggle extends StatefulWidget {
  final String title;
  const TrackingToggle({super.key, required this.title});

  @override
  State<TrackingToggle> createState() => _TrackingToggleState();
}

class _TrackingToggleState extends State<TrackingToggle> {
  final ValueNotifier<bool> _isSwitched = ValueNotifier<bool>(false);

  @override
  void dispose() {
    _isSwitched.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.title, style: context.bodyMedium),
          ValueListenableBuilder<bool>(
            valueListenable: _isSwitched,
            builder: (context, value, child) {
              return Switch(
                value: value,
                onChanged: (v) {
                  _isSwitched.value = v;
                },
                activeColor: AppColors.darkPrimary,
                inactiveThumbColor: AppColors.textGrey,
                inactiveTrackColor: AppColors.dividerGrey.withValues(alpha: 0.3),
              );
            },
          ),
        ],
      ),
    );
  }
}
