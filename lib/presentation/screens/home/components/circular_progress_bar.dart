import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class CircularProgressBar extends StatelessWidget {
  /// percent falue from .0 to 1.0
  final double progress;
  final Color progressColor;
  final Color progressBarColor;

  /// default 5.0
  final double strokeWidth;
  final double size;

  final String additionalText;

  const CircularProgressBar({
    super.key,
    required this.progress,
    required this.progressColor,
    this.progressBarColor = const Color(0xFFEAEAEA),
    this.strokeWidth = 5.0,
    this.size = 100,
    this.additionalText = '',
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _CircularProgressBarPainter(
          progress,
          progressColor,
          progressBarColor,
          strokeWidth,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${(progress * 100).round()}%',
                style: const TextStyle(
                  fontSize: 24,
                  fontFamily: 'Raleway',
                  fontFeatures: [
                    FontFeature('lnum'),
                  ],
                  color: AppColors.font,
                ),
              ),
              if (additionalText.isNotEmpty)
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
          ),
        ),
      ),
    );
  }
}

class _CircularProgressBarPainter extends CustomPainter {
  final double progress;
  final Color progressColor;
  final Color progressBarColor;
  final double strokeWidth;

  _CircularProgressBarPainter(
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

  void _drawProgressBar(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = progressBarColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..isAntiAlias = true;

    canvas.drawCircle(
      Offset(
        size.width / 2,
        size.height / 2,
      ),
      size.width / 2 - strokeWidth / 2,
      paint,
    );
  }

  void _drawProgress(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    canvas.drawArc(
      Rect.fromLTWH(
        strokeWidth / 2,
        strokeWidth / 2,
        size.width - strokeWidth,
        size.height - strokeWidth,
      ),
      -pi / 2,
      pi * 2 * progress,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
