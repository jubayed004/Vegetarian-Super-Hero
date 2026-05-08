import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:vegetarian_super_hero/utils/app_strings/app_strings.dart';
import 'package:vegetarian_super_hero/utils/color/app_colors.dart';
import 'package:vegetarian_super_hero/utils/extension/base_extension.dart';
import '../controller/notification_controller.dart';
import '../model/notification_model.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});
  final controller = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: AppColors.white, size: 18.r),
          onPressed: () => context.pop(),
        ),
        title: Text(AppStrings.notifications.tr, style: context.headlineSmall),
        actions: [
          TextButton(
            onPressed: () => controller.markAllAsRead(),

            child: Text(
              AppStrings.markAllRead.tr,
              style: context.labelMedium.copyWith(
                color: AppColors.darkPrimary,

                decoration: TextDecoration.none,
              ),
            ),
          ),
        ],
        centerTitle: false,
        backgroundColor: AppColors.darkBackground,
        elevation: 0,
      ),
      body: Obx(() {
        if (controller.notifications.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.notifications_none,
                  size: 64.r,
                  color: AppColors.darkBorder,
                ),
                Gap(16.h),
                Text(
                  AppStrings.noNotificationsYet.tr,
                  style: context.bodyLarge.copyWith(
                    color: AppColors.darkSecondaryText,
                  ),
                ),
              ],
            ),
          );
        }
        return SingleChildScrollView(
          padding: EdgeInsets.all(16.r),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.darkSurface.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: AppColors.darkBorder.withValues(alpha: 0.5),
                width: 1.w,
              ),
            ),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.notifications.length,
              separatorBuilder: (context, index) => Divider(
                color: AppColors.darkBorder.withValues(alpha: 0.5),
                height: 1.h,
                indent: 16.w,
                endIndent: 16.w,
              ),
              itemBuilder: (context, index) {
                final notification = controller.notifications[index];
                return NotificationItemWidget(
                  notification: notification,
                  onRemove: () =>
                      controller.removeNotification(notification.id),
                );
              },
            ),
          ),
        );
      }),
    );
  }
}

class NotificationItemWidget extends StatelessWidget {
  final NotificationModel notification;
  final VoidCallback onRemove;

  const NotificationItemWidget({
    super.key,
    required this.notification,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.r),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildIcon(),
          Gap(12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        notification.title,
                        style: context.titleMedium,
                      ),
                    ),
                    Gap(8.w),
                    GestureDetector(
                      onTap: onRemove,
                      child: Icon(
                        Icons.close,
                        color: AppColors.textGreyMuted.withValues(alpha: 0.5),
                        size: 16.r,
                      ),
                    ),
                  ],
                ),
                Gap(4.h),
                Text(notification.subtitle, style: context.bodyMedium),
                Gap(12.h),
                Text(notification.time, style: context.bodySmall),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIcon() {
    Color bgColor;
    IconData iconData;
    Color iconColor;

    switch (notification.type) {
      case NotificationType.workout:
        bgColor = AppColors.deepGreen;
        iconData = Icons.fitness_center;
        iconColor = AppColors.darkPrimary;
        break;
      case NotificationType.protein:
        bgColor = AppColors.deepOrange;
        iconData = Icons.restaurant;
        iconColor = AppColors.orangeAccent;
        break;
      case NotificationType.checkIn:
        bgColor = AppColors.deepYellow;
        iconData = Icons.calendar_today;
        iconColor = AppColors.yellowAccent;
        break;
      case NotificationType.aiPlan:
        bgColor = AppColors.deepGrey;
        iconData = Icons.bolt;
        iconColor = AppColors.white;
        break;
    }

    return Container(
      width: 40.r,
      height: 40.r,
      decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
      child: Center(
        child: Icon(
          iconData,
          color: iconColor.withValues(alpha: 0.8),
          size: 18.r,
        ),
      ),
    );
  }
}
