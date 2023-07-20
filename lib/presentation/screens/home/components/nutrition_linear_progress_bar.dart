import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_paddings.dart';

class NutritionLinearProgressBar extends StatelessWidget {
  final double progress;
  final Color progressColor;
  final Color progressBarColor;
  final double strokeWidth;
  final String additionalText;
  final String label;

  const NutritionLinearProgressBar({
    super.key,
    required this.progress,
    required this.progressColor,
    this.progressBarColor = const Color(0xFFEAEAEA),
    this.strokeWidth = 20,
    required this.additionalText,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: strokeWidth,
          child: CustomPaint(
            painter: _LinearProgressBarPainter(
              progress,
              progressColor,
              progressBarColor,
              strokeWidth,
            ),
            child: Center(
              child: Text(
                '${(progress * 100).round()}%',
                style: const TextStyle(
                  fontSize: 14,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w500,
                  fontFeatures: [
                    FontFeature('lnum'),
                  ],
                  color: AppColors.font,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: AppPaddings.tiny / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
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
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.font,
                  ),
                )
              ],
            ),
            Text(
              additionalText,
              style: const TextStyle(
                fontSize: 12,
                fontFamily: 'Raleway',
                fontFeatures: [
                  FontFeature('lnum'),
                ],
                color: AppColors.font,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class _LinearProgressBarPainter extends CustomPainter {
  final double progress;
  final Color progressColor;
  final Color progressBarColor;
  final double strokeWidth;

  _LinearProgressBarPainter(
    this.progress,
    this.progressColor,
    this.progressBarColor,
    this.strokeWidth,
  );

  @override
  void paint(Canvas canvas, Size size) {
    _drawProgressBar(canvas, size);
    _drawProgress(canvas, size);
  }

  void _drawProgress(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = progressColor
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(
      Offset(
        strokeWidth / 2 - 1,
        strokeWidth / 2 - 1,
      ),
      Offset(
        size.width * progress,
        strokeWidth / 2 - 1,
      ),
      paint,
    );
  }

  void _drawProgressBar(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = progressBarColor
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(
      Offset(
        strokeWidth / 2 - 1,
        strokeWidth / 2 - 1,
      ),
      Offset(
        size.width - strokeWidth / 2 + 1,
        strokeWidth / 2 - 1,
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
