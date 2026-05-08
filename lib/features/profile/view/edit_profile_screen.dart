import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:vegetarian_super_hero/share/widgets/button/custom_button.dart';
import 'package:vegetarian_super_hero/share/widgets/network_image/custom_network_image.dart';
import 'package:vegetarian_super_hero/share/widgets/text_field/custom_text_field.dart';
import 'package:vegetarian_super_hero/utils/app_strings/app_strings.dart';
import 'package:vegetarian_super_hero/utils/color/app_colors.dart';
import 'package:vegetarian_super_hero/utils/extension/base_extension.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(
        backgroundColor: AppColors.darkBackground,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: AppColors.white, size: 18.r),
          onPressed: () => context.pop(),
        ),
        centerTitle: false,
        title: Text(
          AppStrings.editProfileCaps.tr,
          style: context.headlineSmall.copyWith(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          children: [
            // Profile Image with Camera Overlay
            Center(
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(2.r),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.darkPrimary.withValues(alpha: 0.3),
                          blurRadius: 15,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: CustomNetworkImage(
                      imageUrl:
                          'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                      height: 100.r,
                      width: 100.r,
                      boxShape: BoxShape.circle,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(6.r),
                      decoration: BoxDecoration(
                        color: AppColors.darkSurface,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.darkPrimary,
                          width: 1.5.w,
                        ),
                      ),
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: AppColors.darkPrimary,
                        size: 16.r,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Gap(12.h),
            Text(
              AppStrings.tapAvatarToChangePhoto.tr,
              style: context.bodyMedium.copyWith(
                color: AppColors.darkSecondaryText,
              ),
            ),
            Gap(32.h),

            // Form Fields
            CustomTextField(
              title: AppStrings.displayName.tr,
              hintText: "Abhik Patel",
              fillColor: AppColors.darkSurface.withValues(alpha: 0.3),
            ),
            Gap(20.h),
            CustomTextField(
              title: AppStrings.emailAddress.tr,
              hintText: "demo@vss.app",
              readOnly: true,
              fillColor: AppColors.darkSurface.withValues(alpha: 0.3),
              suffixIcon: Icon(
                Icons.lock_outline,
                color: AppColors.darkSecondaryText.withValues(alpha: 0.5),
                size: 18.r,
              ),
            ),
            Gap(20.h),
            CustomTextField(
              title: AppStrings.goalCaps.tr,
              hintText: AppStrings.notSet.tr,
              readOnly: true,
              fillColor: AppColors.darkSurface.withValues(alpha: 0.3),
              suffixIcon: Icon(
                Icons.lock_outline,
                color: AppColors.darkSecondaryText.withValues(alpha: 0.5),
                size: 18.r,
              ),
            ),
            Gap(20.h),
            CustomTextField(
              title: AppStrings.experienceLevel.tr,
              hintText: AppStrings.notSet.tr,
              readOnly: true,
              fillColor: AppColors.darkSurface.withValues(alpha: 0.3),
              suffixIcon: Icon(
                Icons.lock_outline,
                color: AppColors.darkSecondaryText.withValues(alpha: 0.5),
                size: 18.r,
              ),
            ),
            Gap(16.h),

            // Disclaimer
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                AppStrings.goalExperienceDisclaimer.tr,
                textAlign: TextAlign.center,
                style: context.bodySmall.copyWith(
                  color: AppColors.darkSecondaryText,
                  height: 1.4,
                ),
              ),
            ),
            Gap(32.h),

            // Submit Button
            CustomButton(
              text: AppStrings.saveChanges.tr,
              onTap: () {
                context.pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
