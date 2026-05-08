import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:vegetarian_super_hero/share/widgets/network_image/custom_network_image.dart';
import 'package:vegetarian_super_hero/utils/color/app_colors.dart';
import 'package:vegetarian_super_hero/utils/extension/base_extension.dart';

class UserInfoCard extends StatelessWidget {
  final String name;
  final String email;

  const UserInfoCard({super.key, required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: AppColors.darkSurface.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: AppColors.darkBorder.withValues(alpha: 0.5),
          width: 1.w,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(2.r),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.darkPrimary.withValues(alpha: 0.3),
                  blurRadius: 15,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: CustomNetworkImage(
              imageUrl:
                  'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              height: 70.r,
              width: 70.r,
              boxShape: BoxShape.circle,
            ),
          ),
          Gap(20.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: context.titleLarge),
              Gap(4.h),
              Text(email, style: context.bodyMedium),
            ],
          ),
        ],
      ),
    );
  }
}
