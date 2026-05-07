import 'package:flutter/material.dart';
import 'package:get/get.dart' hide ContextExtensionss;

import 'package:go_router/go_router.dart';
import 'package:vegetarian_super_hero/core/custom_assets/assets.gen.dart';
import 'package:vegetarian_super_hero/core/router/route_path.dart';
import 'package:vegetarian_super_hero/share/widgets/button/custom_button.dart';
import 'package:vegetarian_super_hero/utils/app_strings/app_strings.dart';
import 'package:vegetarian_super_hero/utils/color/app_colors.dart';
import 'package:vegetarian_super_hero/utils/extension/base_extension.dart';

class AuthSelectionScreen extends StatelessWidget {
  const AuthSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: SafeArea(
        child: Stack(
          children: [
            // Static Logo
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 150),
                child: Assets.images.spalshLogo.image(height: 120),
              ),
            ),

            // Bottom Content
            Positioned(
              bottom: 40,
              left: 20,
              right: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "FUEL FOR\nPERFORMANCE",
                    style: context.textTheme.headlineLarge?.copyWith(
                      color: AppColors.white,
                      height: 1.1,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    AppStrings
                        .precisionMacrosDesignedForPeakPlantBasedOutput
                        .tr,
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: AppColors.darkSecondaryText,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 2,
                    width: context.screenWidth * 0.4,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.darkPrimary.withValues(alpha: 0.8),
                          Colors.transparent,
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Create Account Button
                  CustomButton(
                    text: AppStrings.createAccount.tr,
                    onTap: () {
                      context.go(RoutePath.signUpScreen);
                    },
                  ),
                  SizedBox(height: 16),

                  // Log In Button
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        context.go(RoutePath.loginScreen);
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: AppColors.darkPrimary,
                          width: 1.5,
                        ),
                        foregroundColor: AppColors.darkPrimary,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        AppStrings.logIn.tr.toUpperCase(),
                        style: context.textTheme.titleMedium?.copyWith(
                          color: AppColors.darkPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
