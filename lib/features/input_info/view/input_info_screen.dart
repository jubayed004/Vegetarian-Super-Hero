import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:vegetarian_super_hero/core/router/routes.dart';
import 'package:vegetarian_super_hero/features/input_info/controller/input_info_controller.dart';
import 'package:vegetarian_super_hero/features/input_info/widgets/input_info_steps.dart';
import 'package:vegetarian_super_hero/share/widgets/button/custom_button.dart';
import 'package:vegetarian_super_hero/utils/app_strings/app_strings.dart';
import 'package:vegetarian_super_hero/utils/color/app_colors.dart';
import 'package:vegetarian_super_hero/utils/config/app_config.dart';
import 'package:vegetarian_super_hero/utils/extension/base_extension.dart';

class InputInfoScreen extends StatelessWidget {
  const InputInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<InputInfoController>();

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
          onPressed: () {
            if (controller.currentIndex.value > 0) {
              controller.previousPage();
            } else {
              AppRouter.route.pop();
            }
          },
        ),
        title: Obx(
          () => Text(
            '${controller.currentIndex.value + 1}/9',
            style: context.titleMedium.copyWith(
              color: AppColors.white,
              fontFamily: AppConfig.secondaryFont,
              fontSize: 18,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Obx(
                () {
                  double progress = (controller.currentIndex.value + 1) / 9;
                  return Container(
                    height: 8,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.white.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Align(
                          alignment: Alignment.centerLeft,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            width: constraints.maxWidth * progress,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.darkPrimary.withValues(alpha: 0.7),
                                  AppColors.darkPrimary,
                                ],
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            const Gap(30),
            Expanded(
              child: PageView(
                controller: controller.pageController,
                onPageChanged: controller.onPageChanged,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  BasicInfoStep(controller: controller),
                  BodyMetricsStep(controller: controller),
                  GoalStep(controller: controller),
                  ActivityStep(controller: controller),
                  ExperienceStep(controller: controller),
                  DietStep(controller: controller),
                  MealFrequencyStep(controller: controller),
                  LifestyleStep(controller: controller),
                  InjuriesStep(controller: controller),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Obx(
                () => CustomButton(
                  text: controller.currentIndex.value == 8
                      ? AppStrings.reviewMyPlan.tr.toUpperCase()
                      : AppStrings.continueText.tr.toUpperCase(),
                  onTap: controller.nextPage,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
