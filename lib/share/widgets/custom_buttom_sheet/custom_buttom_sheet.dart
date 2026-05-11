import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:vegetarian_super_hero/core/custom_assets/assets.gen.dart';
import 'package:vegetarian_super_hero/core/router/route_path.dart';
import 'package:vegetarian_super_hero/core/router/routes.dart';
import 'package:vegetarian_super_hero/share/widgets/button/custom_button.dart';
import 'package:vegetarian_super_hero/utils/extension/base_extension.dart';
import '../../../utils/color/app_colors.dart';

Widget makeDismissable({required Widget child}) => GestureDetector(
  behavior: HitTestBehavior.opaque,
  onTap: () => Get.back(),
  child: GestureDetector(onTap: () {}, child: child),
);

void showYesNoModal(
  BuildContext context, {
  required String title,
  required String message,
  required String confirmButtonText,
  required VoidCallback onConfirm,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return ConfirmationModalBottomSheet(
        title: title,
        message: message,
        confirmButtonText: confirmButtonText,
        onConfirm: onConfirm,
      );
    },
  );
}
// ---------------------------------------------

class ConfirmationModalBottomSheet extends StatelessWidget {
  final String title;
  final String message;
  final String confirmButtonText;
  final VoidCallback onConfirm;

  const ConfirmationModalBottomSheet({
    super.key,
    required this.title,
    required this.message,
    required this.confirmButtonText,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryTextColor = isDarkMode ? AppColors.white : AppColors.black;

    return makeDismissable(
      child: DraggableScrollableSheet(
        initialChildSize: 0.40,
        minChildSize: 0.25,
        maxChildSize: 0.4,
        expand: false,
        builder: (_, controller) => Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          ),
          child: SingleChildScrollView(
            controller: controller,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(child: Assets.icons.vector.svg()),
                  Gap(24),
                  Text(
                    title,
                    style: context.headlineSmall.copyWith(
                      color: primaryTextColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Gap(12),
                  Text(
                    message,
                    style: context.bodyMedium.copyWith(
                      color: AppColors.white,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Gap(36),
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          text: 'Back'.tr,
                          onTap: () => AppRouter.route.pop(),
                        ),
                      ),
                      Gap(16),
                      Expanded(
                        child: CustomButton(
                          text: confirmButtonText,
                          onTap: () {
                            onConfirm();
                            AppRouter.route.pop();
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------
// Regenerate Plan Bottom Sheet
// ---------------------------------------------

void showRegeneratePlanModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return const RegeneratePlanBottomSheet();
    },
  );
}

class RegeneratePlanBottomSheet extends StatefulWidget {
  const RegeneratePlanBottomSheet({super.key});

  @override
  State<RegeneratePlanBottomSheet> createState() =>
      _RegeneratePlanBottomSheetState();
}

class _RegeneratePlanBottomSheetState extends State<RegeneratePlanBottomSheet> {
  int selectedIndex = 2; // Default to 'Goal change' as per image

  final List<Map<String, String>> reasons = [
    {'title': 'Plateau', 'subtitle': 'weight not changing'},
    {'title': 'Fatigue', 'subtitle': 'body needs refresh'},
    {'title': 'Goal change', 'subtitle': 'new objective'},
  ];

  @override
  Widget build(BuildContext context) {
    return makeDismissable(
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 12, 20, 32),
        decoration: BoxDecoration(
          color: const Color(0xFF111111),
          borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            Gap(24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "REGENERATE PLAN",
                  style: context.headlineSmall.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.1,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.close, color: Colors.white54, size: 24.r),
                ),
              ],
            ),
            Gap(16.h),
            Text(
              "Select reason for regeneration (3 remaining)",
              style: context.bodyMedium.copyWith(color: AppColors.textGrey),
            ),
            Gap(24.h),
            Column(
              children: List.generate(reasons.length, (index) {
                final isSelected = selectedIndex == index;
                return GestureDetector(
                  onTap: () => setState(() => selectedIndex = index),
                  child: Container(
                    margin: EdgeInsets.only(bottom: 12.h),
                    padding: EdgeInsets.all(16.r),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFF1A1A0A)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                        color: isSelected
                            ? AppColors.yellowAccent.withValues(alpha: 0.5)
                            : Colors.white12,
                        width: 1.5,
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          reasons[index]['title']!,
                          style: context.titleMedium.copyWith(
                            color: isSelected
                                ? AppColors.yellowAccent
                                : Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          " — ${reasons[index]['subtitle']}",
                          style: context.bodyMedium.copyWith(
                            color: isSelected
                                ? AppColors.yellowAccent.withValues(alpha: 0.7)
                                : AppColors.textGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
            Gap(16.h),
            CustomButton(
              text: "Confirm Regeneration",
              onTap: () {
                context.goNamed(RoutePath.activatePlanScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------
// Swap Meal Bottom Sheet
// ---------------------------------------------

void showSwapMealModal(BuildContext context, String currentMeal) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return SwapMealBottomSheet(mealName: currentMeal);
    },
  );
}

class SwapMealBottomSheet extends StatelessWidget {
  final String mealName;
  const SwapMealBottomSheet({super.key, required this.mealName});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> alternatives = [
      {'name': 'Tempeh', 'desc': '150g - 195 kcal - P:20g C:8g F:11g'},
      {'name': 'Seitan', 'desc': '100g - 120 kcal - P:25g C:4g F:2g'},
      {'name': 'Chickpeas', 'desc': '200g - 280 kcal - P:15g C:46g F:4g'},
      {'name': 'Edamame', 'desc': '150g - 189 kcal - P:17g C:14g F:8g'},
    ];

    return makeDismissable(
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFF111111),
          borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            Gap(24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "SWAP: ${mealName.toUpperCase()}",
                  style: context.headlineSmall,
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.close, color: Colors.white54, size: 24.r),
                ),
              ],
            ),
            Gap(16.h),
            Text(
              "Same category replacements. Calories remain balanced.",
              style: context.bodyMedium.copyWith(color: AppColors.textGrey),
            ),
            Gap(24.h),
            Flexible(
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: alternatives.length,
                separatorBuilder: (_, __) => Gap(12.h),
                itemBuilder: (context, index) {
                  final item = alternatives[index];
                  return Container(
                    padding: EdgeInsets.all(16.r),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(color: Colors.white10),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['name']!,
                                style: context.titleMedium.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Gap(4.h),
                              Text(
                                item['desc']!,
                                style: context.bodySmall.copyWith(
                                  color: AppColors.textGrey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 8.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              border: Border.all(
                                color: const Color(0xFF2A3B20),
                              ),
                            ),
                            child: Text(
                              "Select",
                              style: context.labelLarge.copyWith(
                                color: AppColors.darkPrimary,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
