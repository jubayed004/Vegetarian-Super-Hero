import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:vegetarian_super_hero/utils/app_strings/app_strings.dart';
import 'package:vegetarian_super_hero/utils/color/app_colors.dart';
import 'package:vegetarian_super_hero/utils/extension/base_extension.dart';
import '../widgets/nutrition_summary_box.dart';
import '../widgets/meal_widgets.dart';
import '../widgets/training_widgets.dart';

class MyPlanScreen extends StatefulWidget {
  const MyPlanScreen({super.key});

  @override
  State<MyPlanScreen> createState() => _MyPlanScreenState();
}

class _MyPlanScreenState extends State<MyPlanScreen> {
  final ValueNotifier<int> _selectedTab = ValueNotifier<int>(0);

  @override
  void dispose() {
    _selectedTab.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: false,
        title: Text(
          AppStrings.myPlan.tr,
          style: context.headlineMedium.copyWith(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
      ),
      body: ValueListenableBuilder<int>(
        valueListenable: _selectedTab,
        builder: (context, activeTab, _) {
          return Column(
            children: [
              // Custom Tab Switcher
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  children: [
                    _buildTabItem(
                      0,
                      AppStrings.nutrition.tr,
                      Icons.restaurant,
                      activeTab,
                    ),
                    Gap(12.w),
                    _buildTabItem(
                      1,
                      AppStrings.training.tr,
                      Icons.fitness_center,
                      activeTab,
                    ),
                  ],
                ),
              ),
              Gap(16.h),
              Divider(
                color: AppColors.darkBorder.withValues(alpha: 0.5),
                height: 1,
              ),
              Gap(24.h),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: activeTab == 0
                      ? _buildNutritionView()
                      : _buildTrainingView(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTabItem(int index, String label, IconData icon, int activeTab) {
    bool isActive = activeTab == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => _selectedTab.value = index,
        child: Container(
          height: 52.h,
          decoration: BoxDecoration(
            color: isActive ? AppColors.darkPrimary : Colors.transparent,
            borderRadius: BorderRadius.circular(12.r),
            border: isActive
                ? null
                : Border.all(
                    color: AppColors.darkBorder.withValues(alpha: 0.8),
                  ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 20.r,
                color: isActive ? Colors.black : AppColors.darkSecondaryText,
              ),
              Gap(10.w),
              Text(
                label,
                style: context.titleMedium.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                  color: isActive ? Colors.black : AppColors.darkSecondaryText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNutritionView() {
    return Column(
      children: [
        const NutritionSummaryBox(),
        Gap(24.h),
        MealSection(
          title: AppStrings.breakfast.tr,
          time: "7:00 AM",
          calories: "520",
          items: const [
            FoodItemTile(
              name: "Greek Yogurt",
              quantity: "200g",
              cals: "130",
              macro: "P:22g",
              macroType: "protein",
            ),
            FoodItemTile(
              name: "Rolled Oats",
              quantity: "80g",
              cals: "296",
              macro: "P:10g",
              macroType: "carb",
            ),
            FoodItemTile(
              name: "Mixed Berries",
              quantity: "100g",
              cals: "57",
              macro: "P:1g",
              macroType: "carb",
            ),
            FoodItemTile(
              name: "Almonds",
              quantity: "15g",
              cals: "87",
              macro: "P:3g",
              macroType: "fat",
            ),
          ],
        ),
        MealSection(
          title: AppStrings.lunch.tr,
          time: "1:30 PM",
          calories: "680",
          items: const [
            FoodItemTile(
              name: "Tofu Scramble",
              quantity: "250g",
              cals: "240",
              macro: "P:28g",
              macroType: "protein",
            ),
            FoodItemTile(
              name: "Brown Rice",
              quantity: "150g",
              cals: "320",
              macro: "P:6g",
              macroType: "carb",
            ),
            FoodItemTile(
              name: "Avocado",
              quantity: "50g",
              cals: "120",
              macro: "P:1g",
              macroType: "fat",
            ),
          ],
        ),
        Gap(20.h),
      ],
    );
  }

  Widget _buildTrainingView() {
    return Column(
      children: [
        const TrainingInfoBox(),
        Gap(24.h),
        const WorkoutCard(
          day: "Monday",
          type: "PUSH",
          duration: "65 min",
          exercises: [
            ExerciseTile(
              name: "Bench Press",
              details: "4 sets · 8-12 reps · 90s rest",
              isCompleted: true,
            ),
            ExerciseTile(
              name: "Overhead Press",
              details: "4 sets · 8-12 reps · 90s rest",
            ),
            ExerciseTile(
              name: "Incline DB Press",
              details: "3 sets · 10-15 reps · 75s rest",
            ),
          ],
        ),
        const WorkoutCard(
          day: "Wednesday",
          type: "PULL",
          duration: "70 min",
          exercises: [
            ExerciseTile(
              name: "Deadlifts",
              details: "4 sets · 5-8 reps · 120s rest",
            ),
            ExerciseTile(
              name: "Pull-ups",
              details: "4 sets · 6-10 reps · 90s rest",
            ),
            ExerciseTile(
              name: "Barbell Rows",
              details: "4 sets · 8-12 reps · 90s rest",
            ),
          ],
        ),
        Gap(20.h),
      ],
    );
  }
}
