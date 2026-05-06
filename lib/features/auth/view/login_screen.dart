import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:vegetarian_super_hero/core/custom_assets/assets.gen.dart';
import 'package:vegetarian_super_hero/core/router/route_path.dart';
import 'package:vegetarian_super_hero/core/router/routes.dart';
import 'package:vegetarian_super_hero/features/auth/controller/auth_controller.dart';
import 'package:vegetarian_super_hero/helper/validator/text_field_validator.dart';
import 'package:vegetarian_super_hero/share/widgets/button/custom_button.dart';
import 'package:vegetarian_super_hero/share/widgets/text_field/custom_text_field.dart';
import 'package:vegetarian_super_hero/utils/app_strings/app_strings.dart';
import 'package:vegetarian_super_hero/utils/color/app_colors.dart';
import 'package:vegetarian_super_hero/utils/extension/base_extension.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Gap(20),
                Assets.images.spalshLogo.image(height: 100),
                const Gap(20),
                Text(
                  AppStrings.welcomeToVegetarianSuperHero.tr.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: context.headlineLarge.copyWith(
                    color: AppColors.white,
                    letterSpacing: 1.2,
                  ),
                ),
                const Gap(40),
                CustomTextField(
                  title: AppStrings.email.tr.toUpperCase(),
                  controller: controller.loginEmailController,
                  hintText: "Enter your email or username",
                  validator: TextFieldValidator.email(),
                  prefixIcon: const Icon(Icons.email_outlined, color: AppColors.white),
                ),
                const Gap(20),
                CustomTextField(
                  title: AppStrings.password.tr.toUpperCase(),
                  controller: controller.loginPasswordController,
                  hintText: "Enter your password",
                  isPassword: true,
                  validator: TextFieldValidator.password(),
                  prefixIcon: const Icon(Icons.lock_outline, color: AppColors.white),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      AppRouter.route.pushNamed(RoutePath.forgetPasswordScreen);
                    },
                    child: Text(
                      AppStrings.forgetPassword.tr,
                      style: context.labelMedium.copyWith(
                        color: AppColors.white.withValues(alpha: 0.6),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                const Gap(20),
                CustomButton(
                  text: AppStrings.logIn.tr,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      // Handle Login
                    }
                  },
                ),
                const Gap(30),
                Row(
                  children: [
                    const Expanded(child: Divider(color: AppColors.white, thickness: 0.5)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "o r",
                        style: context.bodySmall.copyWith(color: AppColors.white),
                      ),
                    ),
                    const Expanded(child: Divider(color: AppColors.white, thickness: 0.5)),
                  ],
                ),
                const Gap(30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _SocialButton(icon: Assets.icons.google.svg()),
                    const Gap(20),
                    _SocialButton(icon: Assets.images.apple.image()),
                    const Gap(20),
                    _SocialButton(icon: Assets.icons.facebook.svg()),
                  ],
                ),
                const Gap(40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.dontHaveAnAccount.tr,
                      style: context.bodyMedium.copyWith(color: AppColors.white),
                    ),
                    TextButton(
                      onPressed: () {
                        AppRouter.route.pushNamed(RoutePath.signUpScreen);
                      },
                      child: Text(
                        AppStrings.signUp.tr,
                        style: context.bodyMedium.copyWith(
                          color: AppColors.primaryText,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  final Widget icon;
  const _SocialButton({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.white, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: SizedBox(
        height: 30,
        width: 30,
        child: icon,
      ),
    );
  }
}
