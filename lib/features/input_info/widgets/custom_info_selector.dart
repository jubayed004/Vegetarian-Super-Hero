import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:vegetarian_super_hero/utils/color/app_colors.dart';
import 'package:vegetarian_super_hero/utils/config/app_config.dart';

class CustomInfoSelector extends StatelessWidget {
  final String value;
  final String? hint;
  final String? suffix;
  final bool showArrows;
  final bool showDropdown;
  final VoidCallback onTap;

  const CustomInfoSelector({
    super.key,
    required this.value,
    this.hint,
    this.suffix,
    this.showArrows = false,
    this.showDropdown = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: AppColors.white.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.white.withValues(alpha: 0.1)),
        ),
        child: Row(
          children: [
            Text(
              value,
              style: TextStyle(
                color: AppColors.white.withValues(alpha: 0.8),
                fontWeight: FontWeight.w500,
                fontFamily: AppConfig.secondaryFont,
                fontSize: 16,
              ),
            ),
            const Spacer(),
            if (showArrows) ...[
              const Icon(Icons.unfold_more,
                  color: AppColors.darkSecondaryText, size: 20),
              const Gap(8),
            ],
            if (hint != null) ...[
              Text(
                hint!,
                style: TextStyle(
                  color: AppColors.white.withValues(alpha: 0.3),
                  fontFamily: AppConfig.secondaryFont,
                  fontSize: 14,
                ),
              ),
              const Gap(8),
            ],
            if (suffix != null)
              Text(
                suffix!,
                style: TextStyle(
                  color: AppColors.white.withValues(alpha: 0.3),
                  fontFamily: AppConfig.secondaryFont,
                  fontSize: 14,
                ),
              ),
            if (showDropdown)
              const Icon(Icons.keyboard_arrow_down,
                  color: AppColors.darkSecondaryText, size: 20),
          ],
        ),
      ),
    );
  }
}
