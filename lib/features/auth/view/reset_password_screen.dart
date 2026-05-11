import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:vegetarian_super_hero/core/router/route_path.dart';
import 'package:vegetarian_super_hero/core/router/routes.dart';
import 'package:vegetarian_super_hero/features/auth/controller/auth_controller.dart';
import 'package:vegetarian_super_hero/helper/validator/text_field_validator.dart';
import 'package:vegetarian_super_hero/share/widgets/button/custom_button.dart';
import 'package:vegetarian_super_hero/share/widgets/text_field/custom_text_field.dart';
import 'package:vegetarian_super_hero/utils/app_strings/app_strings.dart';
import 'package:vegetarian_super_hero/utils/color/app_colors.dart';
import 'package:vegetarian_super_hero/utils/extension/base_extension.dart';

class ResetPasswordScreen extends StatelessWidget {
  final String email;
  final String otp;
  const ResetPasswordScreen({
    super.key,
    required this.email,
    required this.otp,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.white,
            size: 20,
          ),
          onPressed: () => AppRouter.route.pop(),
        ),
        title: Text(
          AppStrings.forgetPassword.tr.toUpperCase(),
          style: context.titleSmall.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.createNewPassword.tr.toUpperCase(),
                  style: context.headlineLarge.copyWith(color: AppColors.white),
                ),
                const Gap(8),
                Text(
                  AppStrings.enterYourCurrentPasswordToResetYourPassword.tr,
                  style: context.bodyMedium.copyWith(
                    color: AppColors.white.withValues(alpha: 0.7),
                  ),
                ),
                const Gap(30),
                CustomTextField(
                  title: AppStrings.currentPassword.tr.toUpperCase(),
                  controller: controller.currentPasswordController,
                  hintText: "Enter Current Password",
                  isPassword: true,
                  validator: TextFieldValidator.password(),
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    color: AppColors.white,
                  ),
                ),
                const Gap(20),
                CustomTextField(
                  title: AppStrings.newPassword.tr.toUpperCase(),
                  controller: controller.newPasswordController,
                  hintText: "Password (Min 6 Characters)",
                  isPassword: true,
                  validator: TextFieldValidator.password(),
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    color: AppColors.white,
                  ),
                ),
                const Gap(20),
                CustomTextField(
                  title: AppStrings.confirmPassword.tr.toUpperCase(),
                  controller: controller.confirmNewPasswordController,
                  hintText: "Password (Min 6 Characters)",
                  isPassword: true,
                  validator: TextFieldValidator.confirmPassword(
                    controller.newPasswordController,
                  ),
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    color: AppColors.white,
                  ),
                ),
                const Gap(40),
                CustomButton(
                  text: AppStrings.savePassword.tr,
                  onTap: () {
                    // if (formKey.currentState!.validate()) {

                    // }
                    context.go(RoutePath.loginScreen);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
