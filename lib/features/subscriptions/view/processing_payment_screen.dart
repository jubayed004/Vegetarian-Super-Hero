import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:vegetarian_super_hero/core/router/route_path.dart';
import 'package:vegetarian_super_hero/core/router/routes.dart';
import 'package:vegetarian_super_hero/utils/app_strings/app_strings.dart';
import 'package:vegetarian_super_hero/utils/color/app_colors.dart';
import 'package:vegetarian_super_hero/utils/extension/base_extension.dart';

class ProcessingPaymentScreen extends StatefulWidget {
  const ProcessingPaymentScreen({super.key});

  @override
  State<ProcessingPaymentScreen> createState() =>
      _ProcessingPaymentScreenState();
}

class _ProcessingPaymentScreenState extends State<ProcessingPaymentScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        AppRouter.route.pushReplacementNamed(RoutePath.paymentSuccessScreen);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RotationTransition(
              turns: _controller,
              child: Container(
                width: 250.r,
                height: 250.r,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: SweepGradient(
                    colors: [Colors.transparent, AppColors.darkPrimary],
                    stops: [0.0, 1.0],
                  ),
                ),
              ),
            ),
            Gap(60.h),
            Text(
              AppStrings.processingPayment.tr.toUpperCase(),
              style: context.headlineSmall.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                fontSize: 24.sp,
              ),
            ),
            Gap(16.h),
            Text(
              AppStrings.pleaseWaitDoNotCloseThisScreen.tr,
              style: context.bodyMedium.copyWith(
                color: const Color(0xFF888888),
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
