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

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
          AppStrings.createAnAccount.tr.toUpperCase(),
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
                  AppStrings.joinVss.tr.toUpperCase(),
                  style: context.headlineLarge.copyWith(color: AppColors.white),
                ),
                const Gap(8),
                Text(
                  AppStrings.yourSuperheroTransformationStartsHere.tr,
                  style: context.bodyMedium.copyWith(
                    color: AppColors.white.withValues(alpha: 0.7),
                  ),
                ),
                const Gap(30),
                CustomTextField(
                  title: AppStrings.name.tr.toUpperCase(),
                  controller: controller.signUpNameController,
                  hintText: "Enter your full name",
                  validator: TextFieldValidator.name(),
                  prefixIcon: const Icon(
                    Icons.person_outline,
                    color: AppColors.white,
                  ),
                ),
                const Gap(20),
                CustomTextField(
                  title: AppStrings.email.tr.toUpperCase(),
                  controller: controller.signUpEmailController,
                  hintText: "Enter your email or username",
                  validator: TextFieldValidator.email(),
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: AppColors.white,
                  ),
                ),
                const Gap(20),
                CustomTextField(
                  title: AppStrings.password.tr.toUpperCase(),
                  controller: controller.signUpPasswordController,
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
                  controller: controller.signUpConfirmPasswordController,
                  hintText: "Password (Min 6 Characters)",
                  isPassword: true,
                  validator: TextFieldValidator.confirmPassword(
                    controller.signUpPasswordController,
                  ),
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    color: AppColors.white,
                  ),
                ),
                const Gap(10),
                Obx(
                  () => Row(
                    children: [
                      Checkbox(
                        value: controller.signUpRememberMe.value,
                        onChanged: (val) => controller.toggleSignUpRememberMe(),
                        activeColor: AppColors.darkPrimary,
                        checkColor: AppColors.black,
                        side: const BorderSide(color: AppColors.white),
                      ),
                      Text(
                        AppStrings.rememberMe.tr,
                        style: context.bodyMedium.copyWith(
                          color: AppColors.white,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(20),
                CustomButton(
                  text: AppStrings.createAccount.tr,
                  onTap: () {
                    // if (formKey.currentState!.validate()) {

                    // }
                    // Handle SignUp
                    AppRouter.route.pushNamed(RoutePath.activeOtpScreen);
                  },
                ),
                const Gap(30),
                Row(
                  children: [
                    const Expanded(
                      child: Divider(color: AppColors.white, thickness: 0.5),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "o r",
                        style: context.bodySmall.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Divider(color: AppColors.white, thickness: 0.5),
                    ),
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
                      AppStrings.alreadyHaveAnAccount.tr,
                      style: context.bodyMedium.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        AppRouter.route.pushNamed(RoutePath.loginScreen);
                      },
                      child: Text(
                        AppStrings.logIn.tr,
                        style: context.bodyMedium.copyWith(
                          color: AppColors.darkPrimary,
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
      child: SizedBox(height: 30, width: 30, child: icon),
    );
  }
}
