import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../../core/constants/app_border_radius.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_paddings.dart';
import 'components/nutrition_progress_bar.dart';

class HomeScreen extends StatefulWidget {
  static const String pageRoute = '/';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(AppBorderRadius.regular),
              ),
            ),
            padding: const EdgeInsets.only(
              top: AppPaddings.big,
              left: AppPaddings.small,
              bottom: AppPaddings.regular,
              right: AppPaddings.small,
            ),
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppPaddings.small,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            //TODO open user info
                          },
                          child: const Icon(
                            FeatherIcons.user,
                            color: AppColors.onPrimary,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            //TODO open settings
                          },
                          child: const Icon(
                            FeatherIcons.sliders,
                            color: AppColors.onPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppPaddings.medium),
                  Container(
                    height: 325,
                    padding: const EdgeInsets.symmetric(
                      vertical: AppPaddings.regular,
                      horizontal: AppPaddings.small,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.lightBackground,
                      borderRadius: BorderRadius.circular(
                        AppBorderRadius.regular,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        NutritionProgressBar(
                          progress: 0.57,
                          additionalText: '${(71 * 0.57).round()} з 71 г.',
                          progressColor: const Color(0xFFE87C7C),
                          label: 'Білки',
                        ),
                        NutritionProgressBar(
                          progress: 0.81,
                          additionalText: '${(108 * 0.81).round()} з 108 г.',
                          progressColor: const Color(0xFF80C57E),
                          label: 'Вугливоди',
                        ),
                        NutritionProgressBar(
                          progress: 0.39,
                          additionalText: '${(58 * 0.39).round()} з 58 г.',
                          progressColor: const Color(0xFFE5D373),
                          label: 'Жири',
                        ),
                      ],
                    ),
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
