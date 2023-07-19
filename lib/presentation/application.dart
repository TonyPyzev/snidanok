import 'package:flutter/material.dart';
import 'package:snidanok/presentation/theme/app_theme.dart';

import 'navigation/navigation.dart';

class Application extends StatelessWidget {
  final String _title = 'Snidanok';

  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: AppTheme().lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: Navigation.initialRoute,
      routes: Navigation.routes,
    );
  }
}
