import 'package:flutter/material.dart';
import 'package:vegetarian_super_hero/share/widgets/loading/loading_widget.dart';
import 'package:vegetarian_super_hero/utils/color/app_colors.dart';
import 'package:vegetarian_super_hero/utils/extension/base_extension.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final bool isLoading;
  final IconData? icon;

  const CustomButton({
    required this.text,
    this.onTap,
    this.isLoading = false,
    this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark ? AppColors.darkPrimary : AppColors.darkSurface;

    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: isLoading ? null : onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          height: 56,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          child: buildChild(context),
        ),
      ),
    );
  }

  Widget buildChild(BuildContext context) {
    if (isLoading) {
      return const LoadingWidget(color: AppColors.white);
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[
            Transform.rotate(
              angle: -0.5, // Tilted dumbbell look
              child: Icon(icon, color: AppColors.black, size: 24),
            ),
            const SizedBox(width: 10),
          ],
          Text(
            text.toUpperCase(),
            style: context.headlineSmall.copyWith(
              color: AppColors.black,
              fontWeight: FontWeight.w900,
              fontSize: 20,
            ),
          ),
        ],
      );
    }
  }
}
