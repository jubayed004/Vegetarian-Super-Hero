import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:vegetarian_super_hero/core/router/route_path.dart';
import 'package:vegetarian_super_hero/core/router/routes.dart';
import 'package:vegetarian_super_hero/share/widgets/button/custom_button.dart';
import 'package:vegetarian_super_hero/utils/app_strings/app_strings.dart';
import 'package:vegetarian_super_hero/utils/color/app_colors.dart';
import 'package:vegetarian_super_hero/utils/extension/base_extension.dart';
import '../widgets/footer_item.dart';
import '../widgets/subscription_plan_card.dart';
import '../widgets/subscription_info_box.dart';
import '../widgets/subscription_legal_footer.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: AppColors.white, size: 20.r),
          onPressed: () => AppRouter.route.pop(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          PopupMenuButton<String>(
            icon: Icon(Icons.more_vert, color: AppColors.white, size: 24.r),
            color: AppColors.darkSurface,
            onSelected: (value) {
              // Handle selection
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                value: 'manage',
                child: Text(
                  AppStrings.manageSubscription.tr,
                  style: context.bodyMedium,
                ),
              ),
              PopupMenuItem(
                value: 'restore',
                child: Text(
                  AppStrings.restoreSubscription.tr,
                  style: context.bodyMedium,
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              // YOUR PLAN IS READY Badge
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: AppColors.badgeSuccessBg,
                  borderRadius: BorderRadius.circular(30.r),
                  border: Border.all(
                    color: AppColors.darkPrimary.withValues(alpha: 0.3),
                    width: 1.5.w,
                  ),
                ),
                child: Text(
                  AppStrings.yourPlanIsReady.tr.toUpperCase(),
                  style: context.labelSmall.copyWith(
                    color: AppColors.darkPrimary,
                  ),
                ),
              ),
              const Gap(24),
              // UNLOCK YOUR SYSTEM Title
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: context.headlineLarge,
                  children: [
                    const TextSpan(
                      text: "UNLOCK YOUR\n",
                      style: TextStyle(color: AppColors.white),
                    ),
                    TextSpan(
                      text: "SYSTEM",
                      style: TextStyle(color: AppColors.darkPrimary),
                    ),
                  ],
                ),
              ),
              const Gap(8),
              // Precision Coaching Subtitle
              Text(AppStrings.precisionCoaching.tr, style: context.bodyLarge),
              const Gap(24),
              // Main Plan Card
              const SubscriptionPlanCard(),
              const Gap(20),
              // Info Box
              const SubscriptionInfoBox(),
              const Gap(40),
              // Start Subscription Button
              CustomButton(
                text: AppStrings.startSubscription150Mo.tr.toUpperCase(),
                onTap: () {
                  AppRouter.route.pushNamed(RoutePath.processingPaymentScreen);
                },
              ),
              const Gap(16),
              Text(
                AppStrings.thenNoChargeUntilTrialEnds.tr,
                style: context.bodySmall.copyWith(
                  color: AppColors.textGreyMuted,
                  fontSize: 14.sp,
                ),
              ),
              const Gap(24),
              // Bottom Row Footer Icons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: FooterItem(
                      icon: Icons.lock_outline,
                      text: AppStrings.secure.tr.replaceFirst("🔒 ", ""),
                    ),
                  ),
                  Expanded(
                    child: FooterItem(
                      icon: Icons.refresh,
                      text: AppStrings.cancelAnytime.tr.replaceFirst("↩️ ", ""),
                    ),
                  ),
                  Expanded(
                    child: FooterItem(
                      icon: Icons.bolt,
                      text: AppStrings.instantAccess.tr.replaceFirst("⚡ ", ""),
                    ),
                  ),
                ],
              ),
              const Gap(32),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Text(
                  AppStrings.subscriptionAutoRenewDisclaimer.tr,
                  textAlign: TextAlign.center,
                  style: context.bodySmall.copyWith(
                    color: AppColors.textGreyMuted,
                    fontSize: 11.sp,
                    height: 1.4,
                  ),
                ),
              ),
              const Gap(24),
              // Legal Links Footer
              const SubscriptionLegalFooter(),
              const Gap(40),
            ],
          ),
        ),
      ),
    );
  }
}
