import 'dart:async';
import 'package:flutter/material.dart';
import 'package:vegetarian_super_hero/features/activate_plan/widgets/building_progress_view.dart';
import 'package:vegetarian_super_hero/features/activate_plan/widgets/final_plan_view.dart';
import 'package:vegetarian_super_hero/utils/app_strings/app_strings.dart';
import 'package:vegetarian_super_hero/utils/color/app_colors.dart';

enum ActivatePlanPhase { building, transition, ready }

class ActivatePlanScreen extends StatefulWidget {
  const ActivatePlanScreen({super.key});

  @override
  State<ActivatePlanScreen> createState() => _ActivatePlanScreenState();
}

class _ActivatePlanScreenState extends State<ActivatePlanScreen>
    with TickerProviderStateMixin {
  ActivatePlanPhase _phase = ActivatePlanPhase.building;
  int _progress = 0;
  int _stepIndex = 0;
  late Timer _timer;

  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;

  final List<String> _steps = [
    AppStrings.analyzingYourBodyData,
    AppStrings.calculatingOptimalMacros,
    AppStrings.buildingYourNutritionPlan,
    AppStrings.structuringYourTrainingProgram,
    AppStrings.optimizingMealTiming,
    AppStrings.finalizingYourSystem,
  ];

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    );

    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _scaleAnimation = CurvedAnimation(
      parent: _scaleController,
      curve: Curves.elasticOut,
    );

    _startFlow();
  }

  void _startFlow() {
    _timer = Timer.periodic(const Duration(milliseconds: 40), (timer) {
      setState(() {
        if (_progress < 100) {
          _progress++;
          _stepIndex = (_progress / (100 / _steps.length)).floor().clamp(
            0,
            _steps.length - 1,
          );
        } else {
          _timer.cancel();
          _phase = ActivatePlanPhase.transition;
          _scaleController.forward(); // Scale up the "Ready" text

          // Wait a bit, then fade out the overlay
          Future.delayed(const Duration(milliseconds: 1500), () {
            if (mounted) {
              _fadeController.forward().then((value) {
                setState(() {
                  _phase = ActivatePlanPhase.ready;
                });
              });
            }
          });
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _fadeController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      body: Stack(
        children: [
          // Final Plan Content (Phase 3) - Always build it once we reach transition
          if (_phase == ActivatePlanPhase.ready ||
              _phase == ActivatePlanPhase.transition)
            const FinalPlanView(),

          // Overlay for Phase 1 & 2
          if (_phase != ActivatePlanPhase.ready)
            FadeTransition(
              opacity: ReverseAnimation(_fadeAnimation),
              child: Container(
                color: AppColors.darkBackground.withValues(
                  alpha: _phase == ActivatePlanPhase.transition ? 0.9 : 1.0,
                ),
                child: BuildingProgressView(
                  progress: _progress,
                  isTransition: _phase == ActivatePlanPhase.transition,
                  stepIndex: _stepIndex,
                  steps: _steps,
                  scaleAnimation: _scaleAnimation,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
