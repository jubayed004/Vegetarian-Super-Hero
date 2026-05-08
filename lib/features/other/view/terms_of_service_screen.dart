import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:vegetarian_super_hero/features/other/controller/other_controller.dart';
import 'package:vegetarian_super_hero/share/widgets/loading/spin_kit_circle.dart';
import 'package:vegetarian_super_hero/share/widgets/no_internet/error_card.dart';
import 'package:vegetarian_super_hero/share/widgets/no_internet/no_data_card.dart';
import 'package:vegetarian_super_hero/share/widgets/no_internet/no_internet_card.dart';
import 'package:vegetarian_super_hero/utils/app_strings/app_strings.dart';
import 'package:vegetarian_super_hero/utils/color/app_colors.dart';
import 'package:vegetarian_super_hero/utils/enum/app_enum.dart';
import 'package:vegetarian_super_hero/utils/extension/base_extension.dart';

class TermsAndConditionScreen extends StatelessWidget {
  const TermsAndConditionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final OtherController controller = Get.find<OtherController>();

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
          AppStrings.termsOfService.tr,
          style: context.titleMedium.copyWith(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
      ),
      body: Obx(() {
        switch (controller.termsLoading.value) {
          case ApiStatus.loading:
            return const Center(
              child: SpinKitCircle(color: AppColors.darkPrimary, size: 40.0),
            );
          case ApiStatus.internetError:
            return NoInternetCard(onTap: () {});
          case ApiStatus.noDataFound:
            return NoDataCard(onTap: () {});
          case ApiStatus.error:
            return ErrorCard(onTap: () {});
          case ApiStatus.completed:
            final content = controller.termsConditionsData.value.data?.content ?? "";
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: HtmlWidget(
                content,
                textStyle: context.bodyMedium.copyWith(
                  color: AppColors.darkSecondaryText,
                  height: 1.5,
                ),
              ),
            );
          }
      }),
    );
  }
}
