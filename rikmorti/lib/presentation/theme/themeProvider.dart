import 'package:flutter/material.dart';
import 'app_colors.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDarkTheme = true;
  Color textFildColorText = AppColors.white;
  Color bottomNavigationBar = AppColors.darkBgColor;
  Color textFildColorBeg = AppColors.darkTextFillColor;
  ThemeData theme = ThemeData(
    scaffoldBackgroundColor: AppColors.darkBgColor,
  );
void changeTheme (){
  isDarkTheme = !isDarkTheme;
theme =  ThemeData(
    scaffoldBackgroundColor: isDarkTheme ?  AppColors.darkBgColor : AppColors.lightBgColr,
    );
   textFildColorText = isDarkTheme ?  AppColors.white : AppColors.black;
   bottomNavigationBar = isDarkTheme ?  AppColors.darkBgColor : AppColors.lightBgColr;
   textFildColorBeg = isDarkTheme ?  AppColors.darkTextFillColor : AppColors.textFildBeg;
  notifyListeners();
}
}
