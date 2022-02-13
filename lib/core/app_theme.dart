import 'package:flutter/material.dart';
import 'package:todo_app/core/app_colors.dart';

class AppTheme {
  static Color backgroundColors(Brightness brightness) =>
      brightness == Brightness.light ? AppColors.white : Color(0xFF333333);

  static final ThemeData lightTheme = ThemeData(
      textTheme: TextTheme(
          headline1: TextStyle(
            color: AppColors.grey,
            fontSize: 13,
            fontWeight: FontWeight.normal,
          ),
          headline2: TextStyle(
            color: AppColors.grey,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          )),
      secondaryHeaderColor: AppColors.white,
      bottomAppBarTheme: BottomAppBarTheme(color: AppColors.cinzaMedio),
      bottomAppBarColor: AppColors.cinzaMedio,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.primaryColor,
        selectedItemColor: AppColors.white,
      ),
      splashColor: AppColors.azulClaro,
      canvasColor: AppColors.primaryColor,
      cardColor: AppColors.white,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.white,
      ),
      unselectedWidgetColor: AppColors.black,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.backgroundColor,
      primaryColor: AppColors.black,
      hoverColor: AppColors.primaryColor);

  static final ThemeData darkTheme = ThemeData(
    textTheme: TextTheme(
        headline1: TextStyle(
          color: AppColors.whiteMedium,
          fontSize: 13,
          fontWeight: FontWeight.normal,
        ),
        headline2: TextStyle(
          color: AppColors.whiteMedium,
          fontSize: 13,
          fontWeight: FontWeight.bold,
        )),
    secondaryHeaderColor: AppColors.tomescuroquatro,
    bottomAppBarColor: AppColors.azulClaro,
    splashColor: AppColors.tomescurodois,
    canvasColor: AppColors.white,
    cardColor: AppColors.tomescuroum,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.tomescurodois,
      foregroundColor: AppColors.white,
    ),
    unselectedWidgetColor: AppColors.white,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.tomescurotres,
    primaryColor: AppColors.white,
    hoverColor: AppColors.tomescuroum,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primarySwatch: Colors.red,
    buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
  );
}
