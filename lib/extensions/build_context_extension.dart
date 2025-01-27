import 'package:flutter/material.dart';
import 'package:starkwager/core/constants/screen_layout.dart';

import '../theme/app_colors.dart';

extension ThemeModeExtension on BuildContext {
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
  bool get isMobile => ScreenLayout.isMobile(this);

  Color get primaryBackgroundColor =>
      isDarkMode ? AppColors.mono100 : AppColors.mono0;

  Color get secondaryBackgroundColor =>
      isDarkMode ? AppColors.mono100 : AppColors.mono20;

  Color get secondaryWidgetColor =>
      isDarkMode ? AppColors.mono90 : AppColors.mono0;

  Color get primaryTextColor =>
      isDarkMode ? AppColors.mono20 : AppColors.blue950;

  Color get secondaryTextColor =>
      isDarkMode ? AppColors.mono40 : AppColors.grayCool100;

  Color get dividerColor =>
      isDarkMode ? AppColors.mono80 : AppColors.dividerColour;

  ThemeData get lightTheme => ThemeData.light().copyWith(
        scaffoldBackgroundColor: AppColors.mono0,
        colorScheme: Theme.of(this).colorScheme.copyWith(
              brightness: Brightness.light,
              primary: AppColors.blueberry100,
              error: AppColors.rambutan100,
            ),
        textTheme: Theme.of(this).textTheme.apply(
              bodyColor: AppColors.mono100,
            ),
      );

  ThemeData get darkTheme => ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppColors.mono100,
        colorScheme: Theme.of(this).colorScheme.copyWith(
              brightness: Brightness.dark,
              primary: AppColors.blueberry100,
              error: AppColors.rambutan100,
            ),
        textTheme: Theme.of(this).textTheme.apply(
              bodyColor: AppColors.mono20,
            ),
      );
}
