import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:vegetarian_super_hero/core/router/route_path.dart';
import 'package:vegetarian_super_hero/core/router/routes.dart';
import 'package:vegetarian_super_hero/features/auth/controller/auth_controller.dart';
import 'package:vegetarian_super_hero/share/widgets/button/custom_button.dart';
import 'package:vegetarian_super_hero/share/widgets/text_field/otp_text_field.dart';
import 'package:vegetarian_super_hero/utils/app_strings/app_strings.dart';
import 'package:vegetarian_super_hero/utils/color/app_colors.dart';
import 'package:vegetarian_super_hero/utils/extension/base_extension.dart';

class ActiveOtpScreen extends StatelessWidget {
  final String email;
  const ActiveOtpScreen({super.key, required this.email});

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.otpVerification.tr.toUpperCase(),
                  style: context.headlineLarge.copyWith(color: AppColors.white),
                ),
                const Gap(8),
                Text(
                  AppStrings.enterYourOtpToResetYourPassword.tr,
                  style: context.bodyMedium.copyWith(
                    color: AppColors.white.withValues(alpha: 0.7),
                  ),
                ),
                const Gap(50),
                Text(
                  AppStrings.enterOtp.tr,
                  style: context.titleMedium.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Gap(16),
                OtpTextField(controller: controller.otpController),
                const Gap(40),
                CustomButton(
                  text: AppStrings.submit.tr,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      AppRouter.route.pushNamed(
                        RoutePath.resetPasswordScreen,
                        extra: {
                          'email': email,
                          'otp': controller.otpController.text,
                        },
                      );
                    }
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
