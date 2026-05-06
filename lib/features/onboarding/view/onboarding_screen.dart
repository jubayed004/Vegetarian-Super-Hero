import 'package:flutter/material.dart';
import 'package:get/get.dart' hide ContextExtensionss;
import 'package:vegetarian_super_hero/utils/extension/base_extension.dart';
import 'package:vegetarian_super_hero/core/custom_assets/assets.gen.dart';
import 'package:vegetarian_super_hero/features/onboarding/controller/onboarding_controller.dart';
import 'package:vegetarian_super_hero/utils/app_strings/app_strings.dart';
import 'package:vegetarian_super_hero/utils/color/app_colors.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final OnboardingController controller = Get.put(OnboardingController());

    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: SafeArea(
        child: Stack(
          children: [
            // Skip Button
            Positioned(
              top: 16,
              right: 20,
              child: GestureDetector(
                onTap: controller.skip,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primaryText.withValues(alpha: 0.5)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                   AppStrings.skip.tr,
                    style: context.textTheme.labelMedium?.copyWith(
                      color: AppColors.primaryText,
                    ),
                  ),
                ),
              ),
            ),

            // Static Logo
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 150),
                child: Assets.images.spalshLogo.image(height: 120),
              ),
            ),

            // Sliding Content
            Positioned(
              bottom: 120,
              left: 0,
              right: 0,
              height: 300,
              child: PageView.builder(
                controller: controller.pageController,
                onPageChanged: controller.onPageChanged,
                itemCount: controller.onboardingPages.length,
                itemBuilder: (context, index) {
                  final model = controller.onboardingPages[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Tag Badge
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: AppColors.primaryText.withValues(alpha: 0.1),
                            border: Border.all(color: AppColors.primaryText.withValues(alpha: 0.3)),
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                              topLeft: Radius.circular(20), // Added for better pill shape look
                              bottomLeft: Radius.circular(20),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 6,
                                height: 6,
                                decoration: const BoxDecoration(
                                  color: AppColors.primaryText,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                model.tag,
                                style: context.textTheme.labelSmall?.copyWith(
                                  color: AppColors.primaryText,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Title
                        RichText(
                          text: TextSpan(
                            style: context.textTheme.headlineLarge?.copyWith(
                              height: 1.2,
                              color: AppColors.white,
                            ),
                            children: [
                              TextSpan(text: model.title1),
                              if (model.title2.isNotEmpty)
                                TextSpan(
                                  text: model.title2,
                                  style: const TextStyle(color: AppColors.primaryText),
                                ),
                              if (model.title3.isNotEmpty)
                                TextSpan(text: model.title3),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        // Subtitle
                        Text(
                          model.subtitle,
                          style: context.textTheme.bodyLarge?.copyWith(
                            color: AppColors.darkSecondaryText,
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Fade Divider
                        Container(
                          height: 2,
                          width: context.screenWidth * 0.4,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                AppColors.primaryText.withValues(alpha: 0.8),
                                Colors.transparent,
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Bottom Navigation
            Positioned(
              bottom: 40,
              left: 20,
              right: 20,
              child: Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Indicators
                      Row(
                        children: List.generate(
                          controller.onboardingPages.length,
                          (index) {
                            bool isActive = controller.currentIndex.value == index;
                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: const EdgeInsets.only(right: 6),
                              height: 6,
                              width: isActive ? 24 : 6,
                              decoration: BoxDecoration(
                                color: isActive
                                    ? AppColors.primaryText
                                    : AppColors.darkSecondaryText.withValues(alpha: 0.5),
                                borderRadius: BorderRadius.circular(6),
                              ),
                            );
                          },
                        ),
                      ),
                      // Next / Get Started Button
                      ElevatedButton(
                        onPressed: controller.nextPage,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryText,
                          foregroundColor: AppColors.black,
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          controller.currentIndex.value == controller.onboardingPages.length - 1
                              ? AppStrings.getStarted.tr
                              : AppStrings.next.tr,
                          style: context.textTheme.titleMedium?.copyWith(
                            color: AppColors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
