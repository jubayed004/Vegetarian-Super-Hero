import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:vegetarian_super_hero/core/custom_assets/assets.gen.dart';
import 'package:vegetarian_super_hero/features/input_info/controller/input_info_controller.dart';
import 'package:vegetarian_super_hero/features/input_info/widgets/custom_info_selector.dart';
import 'package:vegetarian_super_hero/features/input_info/widgets/input_info_helper_widgets.dart';
import 'package:vegetarian_super_hero/features/input_info/widgets/option_card.dart';
import 'package:vegetarian_super_hero/features/input_info/widgets/selectable_chip.dart';
import 'package:vegetarian_super_hero/utils/app_strings/app_strings.dart';
import 'package:vegetarian_super_hero/utils/color/app_colors.dart';
import 'package:vegetarian_super_hero/utils/config/app_config.dart';

class BasicInfoStep extends StatelessWidget {
  final InputInfoController controller;
  const BasicInfoStep({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.basicInfo.tr.toUpperCase(),
            style: TextStyle(
              color: AppColors.white,
              fontSize: 34,
              fontWeight: FontWeight.w900,
              fontFamily: AppConfig.primaryFont,
              letterSpacing: 0,
            ),
          ),
          const Gap(40),
          Text(
            AppStrings.age.tr.toUpperCase(),
            style: TextStyle(
              color: AppColors.white,
              fontFamily: AppConfig.primaryFont,
              fontSize: 16,
              letterSpacing: 1.2,
            ),
          ),
          const Gap(10),
          CustomInfoSelector(
            value: controller.ageController.text.isEmpty
                ? "25"
                : controller.ageController.text,
            suffix: AppStrings.years.tr,
            showArrows: true,
            onTap: () {},
          ),
          const Gap(30),
          Text(
            AppStrings.gender.tr.toUpperCase(),
            style: TextStyle(
              color: AppColors.white,
              fontFamily: AppConfig.primaryFont,
              fontSize: 16,
              letterSpacing: 1.2,
            ),
          ),
          const Gap(10),
          Obx(
            () => CustomInfoSelector(
              value: controller.selectedGender.value.isEmpty
                  ? "Male"
                  : controller.selectedGender.value,
              hint: AppStrings.selectGender.tr,
              showDropdown: true,
              onTap: () {
                _showGenderBottomSheet(context, controller);
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showGenderBottomSheet(
      BuildContext context, InputInfoController controller) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.darkSurface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: const Text("Male", style: TextStyle(color: AppColors.white)),
            onTap: () {
              controller.selectedGender.value = "Male";
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text("Female", style: TextStyle(color: AppColors.white)),
            onTap: () {
              controller.selectedGender.value = "Female";
              Navigator.pop(context);
            },
          ),
          const Gap(20),
        ],
      ),
    );
  }
}

class BodyMetricsStep extends StatelessWidget {
  final InputInfoController controller;
  const BodyMetricsStep({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.bodyMetrics.tr.toUpperCase(),
            style: TextStyle(
              color: AppColors.white,
              fontSize: 34,
              fontWeight: FontWeight.w900,
              fontFamily: AppConfig.primaryFont,
              letterSpacing: 0,
            ),
          ),
          const Gap(40),
          Text(
            AppStrings.height.tr.toUpperCase(),
            style: TextStyle(
              color: AppColors.white,
              fontFamily: AppConfig.primaryFont,
              fontSize: 16,
              letterSpacing: 1.2,
            ),
          ),
          const Gap(10),
          CustomInfoSelector(
            value: controller.heightController.text.isEmpty
                ? "180"
                : controller.heightController.text,
            suffix: AppStrings.unitCm.tr,
            showArrows: true,
            onTap: () {},
          ),
          const Gap(30),
          Text(
            AppStrings.weight.tr.toUpperCase(),
            style: TextStyle(
              color: AppColors.white,
              fontFamily: AppConfig.primaryFont,
              fontSize: 16,
              letterSpacing: 1.2,
            ),
          ),
          const Gap(10),
          CustomInfoSelector(
            value: controller.weightController.text.isEmpty
                ? "60"
                : controller.weightController.text,
            suffix: AppStrings.unitKg.tr,
            showArrows: true,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class GoalStep extends StatelessWidget {
  final InputInfoController controller;
  const GoalStep({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final goals = [
      {
        'label': AppStrings.fatLoss.tr.toUpperCase(),
        'desc': AppStrings.burnFatPreserveMuscle.tr,
        'value': 'Fat Loss',
        'image': Assets.images.gytmone,
      },
      {
        'label': AppStrings.muscleGain.tr.toUpperCase(),
        'desc': AppStrings.buildLeanMuscleMass.tr,
        'value': 'Muscle Gain',
        'image': Assets.images.gymtwo,
      },
      {
        'label': AppStrings.decomposition.tr.toUpperCase(),
        'desc': AppStrings.loseFatGainMuscle.tr,
        'value': 'Decomposition',
        'image': Assets.images.gymthree,
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.yourGoal.tr.toUpperCase(),
            style: TextStyle(
              color: AppColors.white,
              fontSize: 34,
              fontWeight: FontWeight.w900,
              fontFamily: AppConfig.primaryFont,
              letterSpacing: 0,
            ),
          ),
          const Gap(40),
          Expanded(
            child: ListView.separated(
              itemCount: goals.length,
              separatorBuilder: (context, index) => const Gap(16),
              itemBuilder: (context, index) {
                final goal = goals[index];
                final assetImage = goal['image'] as AssetGenImage;
                return Obx(
                  () => OptionCard(
                    title: goal['label'] as String,
                    subtitle: goal['desc'] as String,
                    isSelected: controller.selectedGoal.value == goal['value'],
                    onTap: () =>
                        controller.selectedGoal.value = goal['value'] as String,
                    image: assetImage.image(fit: BoxFit.cover),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ActivityStep extends StatelessWidget {
  final InputInfoController controller;
  const ActivityStep({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final activities = [
      {
        'label': AppStrings.sedentary.tr.toUpperCase(),
        'desc': AppStrings.deskJobLittleMovement.tr,
        'value': 'Sedentary',
      },
      {
        'label': AppStrings.moderate.tr.toUpperCase(),
        'desc': AppStrings.threeToFourActiveDaysPerWeek.tr,
        'value': 'Moderate',
      },
      {
        'label': AppStrings.active.tr.toUpperCase(),
        'desc': AppStrings.physicalJobOrFivePlusDays.tr,
        'value': 'Active',
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.activityLevel.tr.toUpperCase(),
            style: TextStyle(
              color: AppColors.white,
              fontSize: 34,
              fontWeight: FontWeight.w900,
              fontFamily: AppConfig.primaryFont,
              letterSpacing: 0,
            ),
          ),
          const Gap(40),
          Expanded(
            child: ListView.separated(
              itemCount: activities.length,
              separatorBuilder: (context, index) => const Gap(16),
              itemBuilder: (context, index) {
                final activity = activities[index];
                return Obx(
                  () => OptionCard(
                    title: activity['label']!,
                    subtitle: activity['desc']!,
                    isSelected:
                        controller.selectedActivity.value == activity['value'],
                    onTap: () =>
                        controller.selectedActivity.value = activity['value']!,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ExperienceStep extends StatelessWidget {
  final InputInfoController controller;
  const ExperienceStep({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final levels = [
      {
        'label': AppStrings.beginnerRm.tr.toUpperCase(),
        'desc': AppStrings.lessThanOneYearTraining.tr,
        'value': 'Beginner',
      },
      {
        'label': 'INTERMEDIATE',
        'desc': AppStrings.oneToThreeYearsConsistentTraining.tr,
        'value': 'Intermediate',
      },
      {
        'label': 'ADVANCED',
        'desc': AppStrings.threePlusYearsStructuredTraining.tr,
        'value': 'Advanced',
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.experience.tr.toUpperCase(),
            style: TextStyle(
              color: AppColors.white,
              fontSize: 34,
              fontWeight: FontWeight.w900,
              fontFamily: AppConfig.primaryFont,
              letterSpacing: 0,
            ),
          ),
          const Gap(40),
          Expanded(
            child: ListView.separated(
              itemCount: levels.length,
              separatorBuilder: (context, index) => const Gap(16),
              itemBuilder: (context, index) {
                final level = levels[index];
                return Obx(
                  () => OptionCard(
                    title: level['label']!,
                    subtitle: level['desc']!,
                    isSelected:
                        controller.selectedExperience.value == level['value'],
                    onTap: () =>
                        controller.selectedExperience.value = level['value']!,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DietStep extends StatelessWidget {
  final InputInfoController controller;
  const DietStep({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final exclusions = [
      'Dairy',
      'Gluten',
      'Nuts',
      'Soy',
      'Eggs',
      'Legumes',
      'Nightshades',
      'Sugar',
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "DIET PREFERENCES",
            style: TextStyle(
              color: AppColors.white,
              fontSize: 34,
              fontWeight: FontWeight.w900,
              fontFamily: AppConfig.primaryFont,
            ),
          ),
          const Gap(30),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.white.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.primaryText, width: 1),
            ),
            child: Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: const BoxDecoration(
                    color: AppColors.primaryText,
                    shape: BoxShape.circle,
                  ),
                  child:
                      const Icon(Icons.check, color: AppColors.black, size: 20),
                ),
                const Gap(16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "VEGETARIAN",
                      style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: AppConfig.primaryFont,
                        fontSize: 18,
                      ),
                    ),
                    const Gap(2),
                    Text(
                      "Enforced — all plans are plant-based",
                      style: TextStyle(
                        color: AppColors.primaryText.withValues(alpha: 0.8),
                        fontFamily: AppConfig.secondaryFont,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Gap(30),
          Text(
            "Any additional exclusions?",
            style: TextStyle(
              color: AppColors.white.withValues(alpha: 0.7),
              fontFamily: AppConfig.secondaryFont,
              fontSize: 14,
            ),
          ),
          const Gap(16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: exclusions.map((item) {
              return Obx(
                () => SelectableChip(
                  label: item,
                  isSelected: controller.selectedDietExclusions.contains(item),
                  onTap: () => controller.toggleDietExclusion(item),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class MealFrequencyStep extends StatelessWidget {
  final InputInfoController controller;
  const MealFrequencyStep({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "MEAL FREQUENCY",
            style: TextStyle(
              color: AppColors.white,
              fontSize: 34,
              fontWeight: FontWeight.w900,
              fontFamily: AppConfig.primaryFont,
            ),
          ),
          const Gap(10),
          Text(
            "How many meals per day do you prefer?",
            style: TextStyle(
              color: AppColors.white.withValues(alpha: 0.7),
              fontFamily: AppConfig.secondaryFont,
              fontSize: 14,
            ),
          ),
          const Gap(50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularButton(
                icon: Icons.remove,
                onTap: () {
                  int val = int.tryParse(controller.mealFrequency.value) ?? 3;
                  if (val > 2) {
                    controller.mealFrequency.value = (val - 1).toString();
                  }
                },
              ),
              const Gap(40),
              Obx(
                () => Text(
                  controller.mealFrequency.value,
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                    fontFamily: AppConfig.primaryFont,
                  ),
                ),
              ),
              const Gap(40),
              CircularButton(
                icon: Icons.add,
                onTap: () {
                  int val = int.tryParse(controller.mealFrequency.value) ?? 3;
                  if (val < 6) {
                    controller.mealFrequency.value = (val + 1).toString();
                  }
                },
              ),
            ],
          ),
          const Gap(8),
          Center(
            child: Text(
              "meals / day",
              style: TextStyle(
                color: AppColors.white.withValues(alpha: 0.5),
                fontFamily: AppConfig.secondaryFont,
                fontSize: 16,
              ),
            ),
          ),
          const Gap(60),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(5, (index) {
              final count = (index + 2).toString();
              return Obx(
                () => GestureDetector(
                  onTap: () => controller.mealFrequency.value = count,
                  child: Container(
                    width: 56,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.white.withValues(alpha: 0.1),
                      border: Border.all(
                        color: controller.mealFrequency.value == count
                            ? AppColors.primaryText
                            : Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      count,
                      style: TextStyle(
                        color: controller.mealFrequency.value == count
                            ? AppColors.primaryText
                            : AppColors.white.withValues(alpha: 0.6),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

class LifestyleStep extends StatelessWidget {
  final InputInfoController controller;
  const LifestyleStep({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "LIFESTYLE",
            style: TextStyle(
              color: AppColors.white,
              fontSize: 34,
              fontWeight: FontWeight.w900,
              fontFamily: AppConfig.primaryFont,
            ),
          ),
          const Gap(10),
          Text(
            "Help us schedule your meals and workouts optimally.",
            style: TextStyle(
              color: AppColors.white.withValues(alpha: 0.7),
              fontFamily: AppConfig.secondaryFont,
              fontSize: 14,
            ),
          ),
          const Gap(40),
          Text(
            "WAKE UP TIME",
            style: TextStyle(
              color: AppColors.white,
              fontFamily: AppConfig.primaryFont,
              fontSize: 16,
              letterSpacing: 1.2,
            ),
          ),
          const Gap(10),
          Obx(
            () => TimeSelector(
              value: controller.wakeUpTime.value,
              onTap: () async {
                final time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (time != null) {
                  controller.wakeUpTime.value = time.format(context);
                }
              },
            ),
          ),
          const Gap(30),
          Text(
            "PREFERRED WORKOUT TIME",
            style: TextStyle(
              color: AppColors.white,
              fontFamily: AppConfig.primaryFont,
              fontSize: 16,
              letterSpacing: 1.2,
            ),
          ),
          const Gap(10),
          Obx(
            () => TimeSelector(
              value: controller.workoutTime.value,
              onTap: () async {
                final time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (time != null) {
                  controller.workoutTime.value = time.format(context);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class InjuriesStep extends StatelessWidget {
  final InputInfoController controller;
  const InjuriesStep({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final injuries = [
      'Lower Back',
      'Knee',
      'Shoulder',
      'Hip',
      'Wrist',
      'Neck',
      'Ankle',
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "INJURIES",
            style: TextStyle(
              color: AppColors.white,
              fontSize: 34,
              fontWeight: FontWeight.w900,
              fontFamily: AppConfig.primaryFont,
            ),
          ),
          const Gap(30),
          Text(
            "Select any injury areas. We'll avoid stress on these zones.",
            style: TextStyle(
              color: AppColors.white.withValues(alpha: 0.7),
              fontFamily: AppConfig.secondaryFont,
              fontSize: 14,
            ),
          ),
          const Gap(20),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: injuries.map((injury) {
              return Obx(
                () => SelectableChip(
                  label: injury,
                  isSelected: controller.selectedInjuries.contains(injury),
                  onTap: () => controller.toggleInjury(injury),
                ),
              );
            }).toList(),
          ),
          const Gap(30),
          Text(
            "ADDITIONAL NOTES (OPTIONAL)",
            style: TextStyle(
              color: AppColors.white,
              fontFamily: AppConfig.primaryFont,
              fontSize: 16,
              letterSpacing: 1.2,
            ),
          ),
          const Gap(10),
          Container(
            padding: const EdgeInsets.all(16),
            height: 150,
            decoration: BoxDecoration(
              color: AppColors.white.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextField(
              controller: controller.additionalNotesController,
              maxLines: null,
              style: const TextStyle(color: AppColors.white),
              decoration: InputDecoration(
                hintText: "E.G. 'Left Knee — Avoid Deep Squats'",
                hintStyle: TextStyle(
                  color: AppColors.white.withValues(alpha: 0.3),
                  fontSize: 14,
                ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                filled: false,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
