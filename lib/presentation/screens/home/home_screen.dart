import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:snidanok/core/constants/app_border_radius.dart';
import 'package:snidanok/core/constants/app_colors.dart';
import 'package:snidanok/core/constants/app_paddings.dart';

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
                    decoration: BoxDecoration(
                      color: AppColors.lightBackground,
                      borderRadius: BorderRadius.circular(
                        AppBorderRadius.regular,
                      ),
                    ),
                  ),
                  Text('data'),
                ],
              ),
            ),
          ),
          const Center(
            child: Text('Snidanok'),
          ),
        ],
      ),
    );
  }
}
