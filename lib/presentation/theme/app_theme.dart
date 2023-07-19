import 'package:flutter/material.dart';

class AppTheme {
  ThemeData get lightTheme {
    return ThemeData(
      fontFamily: 'Nunito',
    );
  }

  ThemeData get darkTheme {
    return lightTheme.copyWith();
  }
}
