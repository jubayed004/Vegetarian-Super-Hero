import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:vegetarian_super_hero/core/router/route_path.dart';
import 'package:vegetarian_super_hero/utils/app_strings/app_strings.dart';
import 'package:vegetarian_super_hero/utils/color/app_colors.dart';
import 'package:vegetarian_super_hero/utils/extension/base_extension.dart';

import '../widgets/logout_button.dart';
import '../widgets/profile_menu_item.dart';
import '../widgets/stat_card.dart';
import '../widgets/user_info_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leadingWidth: 0,
        centerTitle: false,
        title: Text(
          AppStrings.profile.tr,
          style: context.headlineSmall.copyWith(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Info Card


            
            const UserInfoCard(name: "ABHIK PATEL", email: "demo@vss.app"),
            Gap(24.h),

            // Stats Row
            Row(
              children: [
                Expanded(
                  child: StatCard(
                    title: "V1",
                    subtitle: AppStrings.planVersion.tr,
                  ),
                ),
                Gap(12.w),
                Expanded(
                  child: StatCard(
                    title: "0/3",
                    subtitle: AppStrings.regenerations.tr,
                  ),
                ),
                Gap(12.w),
                Expanded(
                  child: StatCard(
                    title: AppStrings.active.tr,
                    subtitle: AppStrings.status.tr,
                    titleColor: AppColors.darkPrimary,
                  ),
                ),
              ],
            ),
            Gap(32.h),

            // Profile Section
            _buildSectionLabel(context, AppStrings.profile.tr),
            Gap(12.h),
            _buildMenuCard([
              ProfileMenuItem(
                icon: Icons.person_outline,
                title: AppStrings.editProfile.tr,
                onTap: () => context.pushNamed(RoutePath.editProfileScreen),
              ),
              ProfileMenuItem(
                icon: Icons.notifications_none,
                title: AppStrings.notifications.tr,
                onTap: () => context.pushNamed(RoutePath.notificationScreen),
              ),
              // ProfileMenuItem(
              //   icon: Icons.settings_outlined,
              //   title: AppStrings.preferences.tr,
              //   onTap: () {},
              //   isLast: true,
              // ),
            ]),
            Gap(24.h),

            // Subscription Section
            _buildSectionLabel(context, AppStrings.subscription.tr),
            Gap(12.h),
            _buildMenuCard([
              ProfileMenuItem(
                icon: Icons.credit_card_outlined,
                title: AppStrings.manageSubscription.tr,
                onTap: () => context.pushNamed(RoutePath.subscriptionScreen),
                isLast: true,
              ),
            ]),
            Gap(24.h),

            // Legal Section
            _buildSectionLabel(context, AppStrings.legal.tr),
            Gap(12.h),
            _buildMenuCard([
              ProfileMenuItem(
                icon: Icons.description_outlined,
                title: AppStrings.termsOfService.tr,
                onTap: () =>
                    context.pushNamed(RoutePath.termsAndConditionScreen),
              ),
              ProfileMenuItem(
                icon: Icons.shield_outlined,
                title: AppStrings.privacyPolicy.tr,
                onTap: () => context.pushNamed(RoutePath.privacyPolicyScreen),
              ),
              ProfileMenuItem(
                icon: Icons.help_outline,
                title: AppStrings.helpSupport.tr,
                onTap: () => context.pushNamed(RoutePath.contactSupportScreen),
              ),
              ProfileMenuItem(
                icon: Icons.lock_outline,
                title: AppStrings.changePassword.tr,
                onTap: () => context.pushNamed(RoutePath.changePasswordScreen),
                isLast: true,
              ),
            ]),
            Gap(40.h),

            // Log Out Button
            LogoutButton(
              onTap: () {
                context.goNamed(RoutePath.loginScreen);
              },
            ),
            Gap(20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionLabel(BuildContext context, String label) {
    return Text(
      label,
      style: context.labelLarge.copyWith(
        color: AppColors.darkSecondaryText,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.2,
      ),
    );
  }

  Widget _buildMenuCard(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.darkSurface.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: AppColors.darkBorder.withValues(alpha: 0.5),
          width: 1.w,
        ),
      ),
      child: Column(children: children),
    );
  }
}
