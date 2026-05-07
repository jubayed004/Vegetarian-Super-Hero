import 'package:flutter/material.dart';
import 'package:vegetarian_super_hero/utils/color/app_colors.dart';
import 'package:vegetarian_super_hero/utils/extension/base_extension.dart';

class PlanMealRow extends StatelessWidget {
  final String title;
  final String calories;

  const PlanMealRow({super.key, required this.title, required this.calories});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: context.bodySmall),
          Text(
            calories,
            style: context.bodySmall.copyWith(color: AppColors.darkPrimary),
          ),
        ],
      ),
    );
  }
}
