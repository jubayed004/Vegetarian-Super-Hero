import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:vegetarian_super_hero/features/plan/controller/plan_controller.dart';
import 'package:vegetarian_super_hero/utils/app_strings/app_strings.dart';
import 'package:vegetarian_super_hero/utils/color/app_colors.dart';
import 'package:vegetarian_super_hero/utils/extension/base_extension.dart';
import '../widgets/nutrition_summary_box.dart';
import '../widgets/meal_widgets.dart';
import '../widgets/training_widgets.dart';

class MyPlanScreen extends StatelessWidget {
  const MyPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Injecting the PlanController
    final controller = Get.put(PlanController());

    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => CustomScrollView(
            slivers: [
              // Custom App Bar
              SliverAppBar(
                floating: true,
                pinned: false,
                backgroundColor: AppColors.darkBackground,
                elevation: 0,
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

              // Custom Tab Switcher
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          _buildTabItem(
                            context,
                            0,
                            AppStrings.nutrition.tr,
                            Icons.restaurant,
                            controller.selectedTab,
                          ),
                          Gap(12.w),
                          _buildTabItem(
                            context,
                            1,
                            AppStrings.training.tr,
                            Icons.fitness_center,
                            controller.selectedTab,
                          ),
                        ],
                      ),
                      Gap(16.h),
                      Divider(
                        color: AppColors.darkBorder.withValues(alpha: 0.5),
                        height: 1,
                      ),
                      Gap(24.h),
                    ],
                  ),
                ),
              ),

              // Main Content
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                sliver: controller.selectedTab == 0
                    ? _buildNutritionSliver()
                    : _buildTrainingSliver(),
              ),

              SliverToBoxAdapter(child: Gap(40.h)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabItem(BuildContext context, int index, String label,
      IconData icon, int activeTab) {
    bool isActive = activeTab == index;
    final controller = PlanController.to;
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.changeTab(index),
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

  Widget _buildNutritionSliver() {
    return SliverList(
      delegate: SliverChildListDelegate([
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
          title: "Mid-Morning",
          time: "10:30 AM",
          calories: "310",
          items: const [
            FoodItemTile(
              name: "Cottage Cheese",
              quantity: "150g",
              cals: "150",
              macro: "P:18g",
              macroType: "protein",
            ),
            FoodItemTile(
              name: "Apple",
              quantity: "1 medium",
              cals: "95",
              macro: "P:0g",
              macroType: "carb",
            ),
            FoodItemTile(
              name: "Walnuts",
              quantity: "10g",
              cals: "65",
              macro: "P:1g",
              macroType: "fat",
            ),
          ],
        ),
        MealSection(
          title: AppStrings.lunch.tr,
          time: "1:00 PM",
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
        MealSection(
          title: "Pre-Workout",
          time: "4:30 PM",
          calories: "350",
          items: const [
            FoodItemTile(
              name: "Protein Shake",
              quantity: "1 scoop",
              cals: "120",
              macro: "P:24g",
              macroType: "protein",
            ),
            FoodItemTile(
              name: "Banana",
              quantity: "1 large",
              cals: "105",
              macro: "P:1g",
              macroType: "carb",
            ),
            FoodItemTile(
              name: "Rice Cakes",
              quantity: "3 cakes",
              cals: "125",
              macro: "P:3g",
              macroType: "carb",
            ),
          ],
        ),
        MealSection(
          title: AppStrings.dinner.tr,
          time: "7:30 PM",
          calories: "540",
          items: const [
            FoodItemTile(
              name: "Lentil Pasta",
              quantity: "150g",
              cals: "350",
              macro: "P:25g",
              macroType: "protein",
            ),
            FoodItemTile(
              name: "Tomato Sauce",
              quantity: "100g",
              cals: "80",
              macro: "P:2g",
              macroType: "carb",
            ),
            FoodItemTile(
              name: "Spinach",
              quantity: "50g",
              cals: "20",
              macro: "P:2g",
              macroType: "carb",
            ),
            FoodItemTile(
              name: "Olive Oil",
              quantity: "10g",
              cals: "90",
              macro: "P:0g",
              macroType: "fat",
            ),
          ],
        ),
      ]),
    );
  }

  Widget _buildTrainingSliver() {
    return SliverList(
      delegate: SliverChildListDelegate([
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
        const WorkoutCard(
          day: "Friday",
          type: "LEGS",
          duration: "75 min",
          exercises: [
            ExerciseTile(
              name: "Barbell Squats",
              details: "4 sets · 6-10 reps · 120s rest",
            ),
            ExerciseTile(
              name: "Leg Press",
              details: "3 sets · 10-12 reps · 90s rest",
            ),
            ExerciseTile(
              name: "Leg Curls",
              details: "3 sets · 12-15 reps · 60s rest",
            ),
          ],
        ),
      ]),
    );
  }
}
