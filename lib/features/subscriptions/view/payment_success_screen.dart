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

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Success Icon with Glow
            Container(
              width: 100.r,
              height: 100.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.darkPrimary.withOpacity(0.2),
                    blurRadius: 40.r,
                    spreadRadius: 10.r,
                  ),
                ],
              ),
              child: Icon(
                Icons.check_circle_outline,
                color: AppColors.darkPrimary,
                size: 80.r,
              ),
            ),
            Gap(40.h),
            Text(
              AppStrings.paymentSuccessful.tr.toUpperCase(),
              style: context.headlineSmall.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                fontSize: 28.sp,
              ),
            ),
            Gap(16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                AppStrings.welcomeToVssYourTransformationBeginsNow.tr,
                textAlign: TextAlign.center,
                style: context.bodyMedium.copyWith(
                  color: const Color(0xFF888888),
                  fontSize: 16.sp,
                ),
              ),
            ),
            Gap(40.h),
            // Details Card
            Container(
              padding: EdgeInsets.all(20.r),
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Column(
                children: [
                  _buildDetailRow(context, AppStrings.plan.tr, AppStrings.vssMonthly.tr, isBold: true),
                  Gap(12.h),
                  _buildDetailRow(context, AppStrings.amount.tr, "\$150.00", valueColor: AppColors.darkPrimary),
                  Gap(12.h),
                  _buildDetailRow(context, AppStrings.nextBilling.tr, "Jun 2, 2026"),
                ],
              ),
            ),
            Gap(40.h),
            CustomButton(
              text: AppStrings.buildMyPlan.tr.toUpperCase(),
              onTap: () {
             AppRouter.route.pushReplacementNamed(RoutePath.activatePlanScreen);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(BuildContext context, String label, String value,
      {bool isBold = false, Color? valueColor}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: context.bodyMedium.copyWith(
            color: const Color(0xFF888888),
            fontSize: 14.sp,
          ),
        ),
        Text(
          value,
          style: context.bodyMedium.copyWith(
            color: valueColor ?? Colors.white,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            fontSize: 14.sp,
          ),
        ),
      ],
    );
  }
}
