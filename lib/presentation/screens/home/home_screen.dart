import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../../core/constants/app_border_radius.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_paddings.dart';
import 'components/daily_nutrition_progress_card.dart';

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
              boxShadow: [
                BoxShadow(
                  color: Color(0x19000000),
                  blurRadius: 12,
                  offset: Offset(0, 10),
                  spreadRadius: 0,
                ),
              ],
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
                  const DailyNutritionProgressCard(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
