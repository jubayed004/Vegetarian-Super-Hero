import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:vegetarian_super_hero/core/router/route_path.dart';
import 'package:vegetarian_super_hero/utils/app_strings/app_strings.dart';
import 'package:vegetarian_super_hero/utils/color/app_colors.dart';
import 'package:vegetarian_super_hero/utils/extension/base_extension.dart';

class TrainingInfoBox extends StatelessWidget {
  const TrainingInfoBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.darkSurface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.darkBorder.withValues(alpha: 0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Week 10 · Push / Pull / Legs",
            style: context.bodySmall.copyWith(
              color: AppColors.darkSecondaryText,
            ),
          ),
          Gap(4.h),
          Text(
            "03",
            style: context.headlineLarge.copyWith(
              color: AppColors.darkPrimary,
              fontWeight: FontWeight.bold,
              fontSize: 32.sp,
            ),
          ),
          Text(
            AppStrings.sessionsPerWeek.tr,
            style: context.bodySmall.copyWith(
              color: AppColors.darkSecondaryText,
            ),
          ),
        ],
      ),
    );
  }
}

class WorkoutCard extends StatefulWidget {
  final String day;
  final String type;
  final String duration;
  final List<ExerciseTile> exercises;

  const WorkoutCard({
    super.key,
    required this.day,
    required this.type,
    required this.duration,
    required this.exercises,
  });

  @override
  State<WorkoutCard> createState() => _WorkoutCardState();
}

class _WorkoutCardState extends State<WorkoutCard> {
  // Using ValueNotifier for efficient, granular updates
  late ValueNotifier<List<bool>> completionNotifier;
  late ValueNotifier<bool> expansionNotifier;
  static const int _initialVisibleCount = 3;

  @override
  void initState() {
    super.initState();
    completionNotifier = ValueNotifier<List<bool>>(
      widget.exercises.map((e) => e.isCompleted).toList(),
    );
    expansionNotifier = ValueNotifier<bool>(false);
  }

  @override
  void dispose() {
    completionNotifier.dispose();
    expansionNotifier.dispose();
    super.dispose();
  }

  void _completeAll() {
    // Updating the notifier's value triggers a targeted rebuild
    final List<bool> currentStates = List<bool>.from(completionNotifier.value);
    for (int i = 0; i < currentStates.length; i++) {
      currentStates[i] = true;
    }
    completionNotifier.value = currentStates;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 24.h),
      decoration: BoxDecoration(
        color: AppColors.darkSurface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.darkBorder, width: 1),
      ),
      child: Column(
        children: [
          // Header with background image
          Container(
            height: 120.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
              image: const DecorationImage(
                image: NetworkImage(
                  "https://images.unsplash.com/photo-1534438327276-14e5300c3a48?q=80&w=1000",
                ),
                fit: BoxFit.cover,
                opacity: 0.4,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 16.w,
                  bottom: 16.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.day,
                        style: context.labelSmall.copyWith(
                          color: AppColors.darkSecondaryText,
                        ),
                      ),
                      Text(widget.type, style: context.headlineMedium),
                    ],
                  ),
                ),
                Positioned(
                  right: 16.w,
                  bottom: 16.h,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 6.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.6),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      widget.duration,
                      style: context.labelSmall.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.r),
            child: ValueListenableBuilder<bool>(
              valueListenable: expansionNotifier,
              builder: (context, isExpanded, _) {
                return ValueListenableBuilder<List<bool>>(
                  valueListenable: completionNotifier,
                  builder: (context, states, _) {
                    final int totalExercises = widget.exercises.length;
                    final int visibleCount = isExpanded
                        ? totalExercises
                        : (totalExercises > _initialVisibleCount
                            ? _initialVisibleCount
                            : totalExercises);
                    final int hiddenCount = totalExercises - visibleCount;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Render visible exercises
                        ...List.generate(visibleCount, (index) {
                          final exercise = widget.exercises[index];
                          return ExerciseTile(
                            key: ValueKey("${widget.day}_${exercise.name}_$index"),
                            name: exercise.name,
                            details: exercise.details,
                            isCompleted: states[index],
                            onToggle: () {
                              final List<bool> newStates = List<bool>.from(states);
                              newStates[index] = !newStates[index];
                              completionNotifier.value = newStates;
                            },
                          );
                        }),

                        // Show "+ more" button if needed
                        if (!isExpanded && hiddenCount > 0)
                          GestureDetector(
                            onTap: () => expansionNotifier.value = true,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.h),
                              child: Text(
                                "+$hiddenCount ${AppStrings.moreExercises.tr}",
                                style: context.bodySmall.copyWith(
                                  color: AppColors.darkPrimary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),

                        // Show "Show Less" if expanded
                        if (isExpanded && totalExercises > _initialVisibleCount)
                          GestureDetector(
                            onTap: () => expansionNotifier.value = false,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.h),
                              child: Text(
                                "Show Less",
                                style: context.bodySmall.copyWith(
                                  color: AppColors.darkPrimary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),

                        Gap(16.h),
                        InkWell(
                          onTap: _completeAll,
                          borderRadius: BorderRadius.circular(12.r),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.darkPrimary.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(12.r),
                              border: Border.all(
                                color: AppColors.darkPrimary.withValues(alpha: 0.3),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.play_arrow,
                                  color: AppColors.darkPrimary,
                                  size: 20.r,
                                ),
                                Gap(8.w),
                                Text(
                                  AppStrings.completeWorkout.tr,
                                  style: context.bodyMedium.copyWith(
                                    color: AppColors.darkPrimary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ExerciseTile extends StatelessWidget {
  final String name;
  final String details;
  final bool isCompleted;
  final VoidCallback? onToggle;

  const ExerciseTile({
    super.key,
    required this.name,
    required this.details,
    this.isCompleted = false,
    this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        children: [
          // Completion Toggle
          GestureDetector(
            onTap: onToggle,
            child: Container(
              width: 24.r,
              height: 24.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isCompleted
                      ? AppColors.darkPrimary
                      : AppColors.darkSecondaryText,
                  width: 2,
                ),
                color: isCompleted ? AppColors.darkPrimary : Colors.transparent,
              ),
              child: isCompleted
                  ? Icon(Icons.check, color: Colors.black, size: 16.r)
                  : null,
            ),
          ),
          Gap(16.w),
          // Navigation to Video
          Expanded(
            child: GestureDetector(
              onTap: () {
                context.pushNamed(RoutePath.trainingVideoScreen);
              },
              behavior: HitTestBehavior.opaque,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: context.bodyMedium.copyWith(
                            color: isCompleted
                                ? AppColors.darkSecondaryText
                                : AppColors.white,
                            decoration: isCompleted
                                ? TextDecoration.lineThrough
                                : null,
                          ),
                        ),
                        Text(
                          details,
                          style: context.bodySmall.copyWith(
                            color: AppColors.darkSecondaryText,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.darkSecondaryText,
                    size: 14.r,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
