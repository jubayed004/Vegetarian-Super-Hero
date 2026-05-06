import 'package:flutter/material.dart';
import 'package:vegetarian_super_hero/utils/color/app_colors.dart';
import 'package:vegetarian_super_hero/utils/config/app_config.dart';

class CircularButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const CircularButton({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: AppColors.white.withValues(alpha: 0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: AppColors.white, size: 24),
      ),
    );
  }
}

class TimeSelector extends StatelessWidget {
  final String value;
  final VoidCallback onTap;

  const TimeSelector({super.key, required this.value, required this.onTap});

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
        ),
        child: Row(
          children: [
            Text(
              value,
              style: TextStyle(
                color: AppColors.white.withValues(alpha: 0.8),
                fontFamily: AppConfig.secondaryFont,
                fontSize: 16,
              ),
            ),
            const Spacer(),
            Icon(Icons.access_time,
                color: AppColors.white.withValues(alpha: 0.5), size: 20),
          ],
        ),
      ),
    );
  }
}
