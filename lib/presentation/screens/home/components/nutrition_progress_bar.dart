import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_paddings.dart';
import 'circular_progress_bar.dart';

class NutritionCircularProgressBar extends StatelessWidget {
  /// percent falue from .0 to 1.0
  final double progress;
  final Color progressColor;
  final Color progressBarColor;

  /// default 5.0
  final double strokeWidth;
  final double size;

  final String additionalText;
  final String label;

  const NutritionCircularProgressBar({
    super.key,
    required this.progress,
    required this.progressColor,
    this.progressBarColor = const Color(0xFFEAEAEA),
    this.strokeWidth = 10.0,
    this.size = 100,
    this.additionalText = '',
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircularProgressBar(
          progress: progress,
          additionalText: additionalText,
          strokeWidth: strokeWidth,
          progressColor: progressColor,
        ),
        const SizedBox(height: AppPaddings.tiny),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: progressColor,
              ),
            ),
            const SizedBox(width: AppPaddings.tiny / 2),
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.font,
              ),
            )
          ],
        ),
      ],
    );
  }
}
