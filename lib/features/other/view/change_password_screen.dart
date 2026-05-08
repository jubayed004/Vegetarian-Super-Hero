import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:vegetarian_super_hero/features/other/controller/other_controller.dart';
import 'package:vegetarian_super_hero/share/widgets/button/custom_button.dart';
import 'package:vegetarian_super_hero/share/widgets/text_field/custom_text_field.dart';
import 'package:vegetarian_super_hero/utils/app_strings/app_strings.dart';
import 'package:vegetarian_super_hero/utils/color/app_colors.dart';
import 'package:vegetarian_super_hero/utils/extension/base_extension.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final OtherController controller = Get.find<OtherController>();

    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(
        backgroundColor: AppColors.darkBackground,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: AppColors.white, size: 18.r),
          onPressed: () => context.pop(),
        ),
        centerTitle: true,
        title: Text(
          AppStrings.changePasswordCaps.tr,
          style: context.titleMedium.copyWith(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.createNewPasswordCaps.tr,
              style: context.titleLarge.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 24.sp,
                color: AppColors.white,
              ),
            ),
            Gap(8.h),
            Text(
              AppStrings.enterCurrentPasswordToReset.tr,
              style: context.bodyMedium.copyWith(
                color: AppColors.darkSecondaryText,
              ),
            ),
            Gap(32.h),

            // Current Password
            Text(
              AppStrings.currentPassword.tr,
              style: context.bodySmall.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
            Gap(12.h),
            CustomTextField(
              hintText: "Enter Current Password",
              prefixIcon: Icon(Icons.lock_outline,
                  color: AppColors.darkSecondaryText, size: 20.r),
              isPassword: true,
              fillColor: AppColors.surfaceLight,
            ),
            Gap(20.h),

            // New Password
            Text(
              AppStrings.newPassword.tr,
              style: context.bodySmall.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
            Gap(12.h),
            CustomTextField(
              hintText: "Password (Min 6 Characters)",
              prefixIcon: Icon(Icons.lock_outline,
                  color: AppColors.darkSecondaryText, size: 20.r),
              isPassword: true,
              fillColor: AppColors.surfaceLight,
            ),
            Gap(20.h),

            // Confirm Password
            Text(
              AppStrings.confirmPassword.tr,
              style: context.bodySmall.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
            Gap(12.h),
            CustomTextField(
              hintText: "Password (Min 6 Characters)",
              prefixIcon: Icon(Icons.lock_outline,
                  color: AppColors.darkSecondaryText, size: 20.r),
              isPassword: true,
              fillColor: AppColors.surfaceLight,
            ),
            Gap(40.h),

            // Save Button
            Obx(() => CustomButton(
                  text: AppStrings.saveAndChanges.tr,
                  isLoading: controller.changePasswordLoading.value,
                  onTap: () {
                    // Logic for change password will be implemented here
                   context.pop();
                  },
                )),
          ],
        ),
      ),
    );
  }
}
