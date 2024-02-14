import 'package:flutter/material.dart';
import 'app_colors.dart';

class TodoListUiConfig {
  TodoListUiConfig._();
  static ThemeData get theme => ThemeData(
        primaryColor: AppColor.primaryColor,
        primaryColorLight: AppColor.primaryColorLight,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.primaryColor,
          ),
        ),
      );
}
