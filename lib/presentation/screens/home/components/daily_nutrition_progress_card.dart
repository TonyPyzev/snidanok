import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../core/constants/app_border_radius.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_paddings.dart';
import 'nutrition_linear_progress_bar.dart';
import 'nutrition_progress_bar.dart';

class DailyNutritionProgressCard extends StatelessWidget {
  const DailyNutritionProgressCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: AppPaddings.regular,
        horizontal: AppPaddings.small,
      ),
      decoration: BoxDecoration(
        color: AppColors.lightBackground,
        borderRadius: BorderRadius.circular(
          AppBorderRadius.regular,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 12,
            offset: Offset(0, 10),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppPaddings.tiny,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Сьогодні',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '05.07',
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 16,
                    fontFeatures: [
                      FontFeature('lnum'),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: AppPaddings.small),
          NutritionLinearProgressBar(
            progress: 0.61,
            progressColor: const Color(0xFFB3CACB),
            label: 'Калорії',
            additionalText: '${(2155 * 0.57).round()} з 2155 ккал.',
          ),
          const SizedBox(height: AppPaddings.small),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NutritionCircularProgressBar(
                progress: 0.57,
                additionalText: '${(71 * 0.57).round()} з 71 г.',
                progressColor: const Color(0xFFE87C7C),
                label: 'Білки',
              ),
              NutritionCircularProgressBar(
                progress: 0.81,
                additionalText: '${(108 * 0.81).round()} з 108 г.',
                progressColor: const Color(0xFF80C57E),
                label: 'Вугливоди',
              ),
              NutritionCircularProgressBar(
                progress: 0.39,
                additionalText: '${(58 * 0.39).round()} з 58 г.',
                progressColor: const Color(0xFFE5D373),
                label: 'Жири',
              ),
            ],
          ),
          const SizedBox(height: AppPaddings.small),
          const NutritionLinearProgressBar(
            progress: 0.76,
            progressColor: Color(0xFF52A5F1),
            label: 'Вода',
            additionalText: '${(2 * 0.76)} з 2 л.',
          ),
        ],
      ),
    );
  }
}
