import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vegetarian_super_hero/core/router/route_path.dart';
import 'package:vegetarian_super_hero/core/router/routes.dart';

class InputInfoController extends GetxController {
  final PageController pageController = PageController();
  var currentIndex = 0.obs;

  // Step 1: Basic Info
  var selectedGender = "".obs;
  final ageController = TextEditingController();

  // Step 2: Body Metrics
  final heightController = TextEditingController();
  final weightController = TextEditingController();

  // Step 3: Goal
  var selectedGoal = "".obs;

  // Step 4: Activity Level
  var selectedActivity = "".obs;

  // Step 5: Experience
  var selectedExperience = "".obs;

  // Step 6: Diet
  var selectedDietExclusions = <String>[].obs;

  // Step 7: Meal Frequency
  var mealFrequency = "3".obs;

  // Step 8: Lifestyle
  var wakeUpTime = "07:00 AM".obs;
  var workoutTime = "05:00 PM".obs;

  // Step 9: Injuries
  var selectedInjuries = <String>[].obs;
  final additionalNotesController = TextEditingController();

  void onPageChanged(int index) {
    currentIndex.value = index;
  }

  void toggleDietExclusion(String item) {
    if (selectedDietExclusions.contains(item)) {
      selectedDietExclusions.remove(item);
    } else {
      selectedDietExclusions.add(item);
    }
  }

  void nextPage() {
    if (currentIndex.value < 8) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      AppRouter.route.goNamed(RoutePath.subscriptionScreen);
    }
  }

  void previousPage() {
    if (currentIndex.value > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void toggleInjury(String injury) {
    if (selectedInjuries.contains(injury)) {
      selectedInjuries.remove(injury);
    } else {
      selectedInjuries.add(injury);
    }
  }

  @override
  void onClose() {
    pageController.dispose();
    ageController.dispose();
    heightController.dispose();
    weightController.dispose();
    additionalNotesController.dispose();
    super.onClose();
  }
}
