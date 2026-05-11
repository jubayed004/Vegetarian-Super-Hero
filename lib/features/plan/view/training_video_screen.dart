import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:vegetarian_super_hero/utils/color/app_colors.dart';
import 'package:vegetarian_super_hero/utils/extension/base_extension.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrainingVideoScreen extends StatefulWidget {
  const TrainingVideoScreen({super.key});

  @override
  State<TrainingVideoScreen> createState() => _TrainingVideoScreenState();
}

class _TrainingVideoScreenState extends State<TrainingVideoScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    // Using convertUrlToId for extra safety
    final videoId = YoutubePlayer.convertUrlToId(
      "https://www.youtube.com/watch?v=uNN62f55EV0",
    );
    _controller = YoutubePlayerController(
      initialVideoId: videoId ?? 'uNN62f55EV0',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        loop: true,
        isLive: false, // Set to false to allow seeking
        enableCaption: true,
        forceHD: false,
      ),
    );
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: AppColors.darkPrimary,
        progressColors: const ProgressBarColors(
          playedColor: AppColors.darkPrimary,
          handleColor: AppColors.darkPrimary,
        ),
        bottomActions: [
          const Gap(10),
          CurrentPosition(),
          const Gap(10),
          ProgressBar(
            isExpanded: true,
            colors: const ProgressBarColors(
              playedColor: AppColors.darkPrimary,
              handleColor: AppColors.darkPrimary,
            ),
          ),
          const Gap(10),
          RemainingDuration(),
          const Gap(10),
          // Backward 5s
          IconButton(
            icon: const Icon(Icons.replay_5_rounded, color: Colors.white),
            onPressed: () {
              final currentPosition = _controller.value.position;
              _controller.seekTo(currentPosition - const Duration(seconds: 5));
            },
          ),
          // Forward 5s
          IconButton(
            icon: const Icon(Icons.forward_5_rounded, color: Colors.white),
            onPressed: () {
              final currentPosition = _controller.value.position;
              _controller.seekTo(currentPosition + const Duration(seconds: 5));
            },
          ),
          const PlaybackSpeedButton(),
          const FullScreenButton(),
        ],
      ),
      builder: (context, player) {
        return Scaffold(
          backgroundColor: AppColors.darkBackground,
          appBar: AppBar(
            scrolledUnderElevation: 0,
            leading: IconButton(
              onPressed: () => context.pop(),
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
                size: 20.r,
              ),
            ),
            title: Text(
              "TRAINING VIDEO",
              style: context.headlineSmall.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(20.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // YouTube Player Section
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: player,
                ),
                Gap(24.h),
                Text(
                  "BENCH PRESS",
                  style: context.headlineMedium.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.1,
                  ),
                ),
                Gap(4.h),
                Text(
                  "Chest",
                  style: context.titleMedium.copyWith(
                    color: AppColors.darkPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gap(16.h),
                const Divider(color: AppColors.dividerGrey, thickness: 0.5),
                Gap(20.h),
                Row(
                  children: [
                    _buildStatItem(context, "4", "Sets", AppColors.greenAccent),
                    Gap(12.w),
                    _buildStatItem(
                      context,
                      "8-12",
                      "Reps",
                      AppColors.yellowAccent,
                    ),
                    Gap(12.w),
                    _buildStatItem(
                      context,
                      "90S",
                      "Rest",
                      AppColors.darkPrimary,
                    ),
                  ],
                ),
                Gap(24.h),
                Text(
                  "Focus on controlled movement through the full range of motion. Keep core engaged. Breathe out on exertion. Take full rest between sets for maximum performance.",
                  style: context.bodyMedium.copyWith(
                    color: AppColors.textGreyLight,
                    height: 1.5,
                  ),
                ),
                Gap(20.h),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildStatItem(
    BuildContext context,
    String value,
    String label,
    Color color,
  ) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: AppColors.dividerGrey.withValues(alpha: 0.1),
          ),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: context.titleLarge.copyWith(
                color: color,
                fontWeight: FontWeight.w900,
              ),
            ),
            Gap(4.h),
            Text(
              label,
              style: context.bodySmall.copyWith(color: AppColors.textGrey),
            ),
          ],
        ),
      ),
    );
  }
}
