import 'package:flutter/material.dart';
import 'package:get/get.dart' hide ContextExtensionss;
import 'package:go_router/go_router.dart';
import 'package:vegetarian_super_hero/core/router/route_path.dart';
import 'package:vegetarian_super_hero/core/router/routes.dart';
import 'package:vegetarian_super_hero/features/onboarding/model/onboarding_model.dart';
import 'package:vegetarian_super_hero/utils/app_strings/app_strings.dart';
import 'package:vegetarian_super_hero/utils/extension/base_extension.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();
  var currentIndex = 0.obs;

  List<OnboardingModel> get onboardingPages => [
    OnboardingModel(
      tag: AppStrings.superhuman.tr.toUpperCase(),
      title1: "BUILD YOUR\n",
      title2: "SUPERHUMAN\n",
      title3: "BODY",
      subtitle: AppStrings.plantPoweredAiBuiltUnstoppable.tr,
    ),
    OnboardingModel(
      tag: AppStrings.system.tr.toUpperCase(),
      title1: AppStrings.becomeTheSystem.tr,
      subtitle: AppStrings.trainFuelEvolve.tr,
    ),
    OnboardingModel(
      tag: AppStrings.evolution.tr.toUpperCase(),
      title1: AppStrings.trackYourEvolution.tr,
      subtitle: "Weekly check-ins evolve your plan as your body transforms.".tr,
    ),
    OnboardingModel(
      tag: "TRAINING", // Raw string
      title1: "TRAIN WITH\nPRECISION",
      subtitle: AppStrings
          .mostAiAppsGenerateGenericPlansOursHasBeenDesignedToCreateTheProperStructureBasedOnTheIndividual
          .tr,
    ),
  ];

  void onPageChanged(int index) {
    currentIndex.value = index;
  }

  void nextPage() {
    if (currentIndex.value < onboardingPages.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
   
      
AppRouter.route.goNamed(RoutePath.authSelectionScreen);
    }
  }

  void skip() {
     AppRouter.route.goNamed(RoutePath.authSelectionScreen);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
