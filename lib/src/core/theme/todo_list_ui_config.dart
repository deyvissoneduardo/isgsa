import 'package:flutter/material.dart';
import 'app_colors.dart';

class TodoListUiConfig {
  TodoListUiConfig._();
  static ThemeData get theme => ThemeData(
        primaryColor: AppColors.primaryColor,
        primaryColorLight: AppColors.primaryColorLight,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
          ),
        ),
      );
}
