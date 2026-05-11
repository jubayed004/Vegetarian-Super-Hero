import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:vegetarian_super_hero/core/router/routes.dart';
import 'package:vegetarian_super_hero/features/nav/controller/nav_controller.dart';
import 'package:vegetarian_super_hero/features/plan/controller/plan_controller.dart';
import 'package:vegetarian_super_hero/utils/app_strings/app_strings.dart';
import 'package:vegetarian_super_hero/utils/color/app_colors.dart';
import 'package:vegetarian_super_hero/utils/extension/base_extension.dart';

class NutritionTrainingSection extends StatelessWidget {
  const NutritionTrainingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildActionCard(
            context: context,
            icon: Icons.restaurant_rounded,
            iconColor: AppColors.yellowAccent,
            title: AppStrings.nutrition.tr,
            onTap: () {
              NavController.to.changeIndex(1); // Go to Plan main tab
              Get.put(PlanController()).changeTab(0); // Select Nutrition sub-tab
            },
          ),
        ),
        Gap(12.w),
        Expanded(
          child: _buildActionCard(
            context: context,
            icon: Icons.fitness_center_rounded,
            iconColor: AppColors.darkPrimary,
            title: AppStrings.training.tr,
            onTap: () {
              NavController.to.changeIndex(1); // Go to Plan main tab
              Get.put(PlanController()).changeTab(1); // Select Training sub-tab
            },
          ),
        ),
      ],
    );
  }

  Widget _buildActionCard({
    required BuildContext context,
    required IconData icon,
    required Color iconColor,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          color: AppColors.surfaceDeep,
          borderRadius: BorderRadius.circular(6.r),
          border: Border.all(
            color: AppColors.darkPrimary.withValues(alpha: 0.3),
            width: 1.r,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: iconColor, size: 28.r),
            Gap(12.h),
            Text(title, style: context.titleMedium),
          ],
        ),
      ),
    );
  }
}
