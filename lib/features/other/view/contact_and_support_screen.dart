import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:vegetarian_super_hero/share/widgets/button/custom_button.dart';
import 'package:vegetarian_super_hero/share/widgets/text_field/custom_text_field.dart';
import 'package:vegetarian_super_hero/utils/app_strings/app_strings.dart';
import 'package:vegetarian_super_hero/utils/color/app_colors.dart';
import 'package:vegetarian_super_hero/utils/extension/base_extension.dart';

class ContactAndSupportScreen extends StatelessWidget {
  const ContactAndSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(
        backgroundColor: AppColors.darkBackground,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: AppColors.white, size: 18.r),
          onPressed: () => context.pop(),
        ),
        centerTitle: true,
        title: Text(
          AppStrings.helpSupportCaps.tr,
          style: context.titleMedium.copyWith(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.emailUsOnlineCaps.tr,
              style: context.titleMedium.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
            Gap(16.h),

            // Email Online Card
            Container(
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.darkPrimary, width: 1),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                      color: AppColors.darkPrimary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Icon(Icons.email_outlined,
                        color: AppColors.darkPrimary, size: 24.r),
                  ),
                  Gap(12.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.emailUsOnline.tr,
                        style: context.bodyMedium.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Online",
                        style: context.bodySmall.copyWith(
                          color: AppColors.darkPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Gap(24.h),

            // Subject Field
            CustomTextField(
              hintText: AppStrings.subject.tr,
              fillColor: AppColors.surfaceLight,
            ),
            Gap(16.h),

            // Message Field
            CustomTextField(
              hintText: AppStrings.describeIssueDetail.tr,
              maxLines: 5,
              fillColor: AppColors.surfaceLight,
            ),
            Gap(24.h),

            // Send Message Button
            CustomButton(
              text: AppStrings.sendMessage.tr,
              onTap: () {
                // Logic to send message
              },
            ),
            Gap(32.h),

            // FAQ Section
            Text(
              AppStrings.frequentlyAskedCaps.tr,
              style: context.titleMedium.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
            Gap(16.h),

            _buildFaqItem(context, "How do I cancel my subscription?"),
            _buildFaqItem(context, "Can I regenerate my AI plan?"),
            _buildFaqItem(context, "Why isn't my progress updating?"),
            _buildFaqItem(context, "How do I restore a previous purchase?"),
          ],
        ),
      ),
    );
  }

  Widget _buildFaqItem(BuildContext context, String question) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: Text(
            question,
            style: context.bodyMedium.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          iconColor: AppColors.darkSecondaryText,
          collapsedIconColor: AppColors.darkSecondaryText,
          childrenPadding:
              EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.h),
          children: [
            Text(
              "To manage this, please navigate to your profile settings or contact our support team for further assistance.",
              style: context.bodySmall.copyWith(
                color: AppColors.darkSecondaryText,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
