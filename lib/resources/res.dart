import 'package:flutter/material.dart';

///Defined Sizes
class Sizes {
  static const paddingXS = 4.0;
  static const paddingS = 8.0;
  static const padding = 16.0;
  static const paddingM = 32.0;
  static const borderRadiusS = 8.0;
  static const loaderSize = 50.0;
  static const errorLottieSize = 150.0;
}

///Defined Colors
class AppColors {
  static const seed = Colors.cyan;
}

///Available Lottie files
class LottieFiles {
  static const error = "assets/lotties/error.json";
}

///Defined Durations
class Durations {
  static const smallDuration = Duration(milliseconds: 150);
}

///Defined App Themes
class AppTheme {
  //Light theme
  static ThemeData get lightTheme => ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.seed,
          brightness: Brightness.light,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  Sizes.borderRadiusS,
                ),
              ),
            ),
          ),
        ),
        useMaterial3: true,
        brightness: Brightness.light,
      );

  //Dark theme
  static ThemeData get darkTheme => ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.seed,
          brightness: Brightness.dark,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  Sizes.borderRadiusS,
                ),
              ),
            ),
          ),
        ),
        useMaterial3: true,
        brightness: Brightness.dark,
      );
}
