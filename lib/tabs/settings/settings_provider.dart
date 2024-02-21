import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
class settingsProvider with ChangeNotifier
{
  ThemeMode themeMode =ThemeMode.light;
  String languag = 'ar';
  String get backGroundName=>
      themeMode==ThemeMode.light?'default_bg':'dark_bg';
  Color get azqar_bk_color =>
      themeMode==ThemeMode.light? appTheme.primaryLight: appTheme.gold;
  Color get container_sura_details_screen=>
      themeMode==ThemeMode.light? appTheme.white: appTheme.primaryDark;
  Color get container_hadeth_details_screen=>
      themeMode==ThemeMode.light? appTheme.white: appTheme.primaryDark;
  Color get container=>
      themeMode==ThemeMode.light? appTheme.primaryLight: appTheme.gold;
  String get sebha=>
      themeMode==ThemeMode.light?'group9.png':'group10.png';
  Color get sebha_text=>
      themeMode==ThemeMode.light? appTheme.white: appTheme.black;
  Color get sebha_container_text=>
      themeMode==ThemeMode.light? appTheme.primaryLight: appTheme.primaryDark;

  Color get radio_icons=>
      themeMode==ThemeMode.light? appTheme.primaryLight: appTheme.gold;
  Color get radio_text=>
      themeMode==ThemeMode.light? appTheme.black: appTheme.white;

  Color get settings_text=>
      themeMode==ThemeMode.light? appTheme.black: appTheme.gold;
  void changeTheme(ThemeMode selectedTheme){
    if(selectedTheme == themeMode) {
      return;
    }
    themeMode = selectedTheme;
    notifyListeners();

  }

  void changeLanguage(String selectedLanguage){
    if(selectedLanguage == languag) {
      return;
    }
    languag = selectedLanguage;
    notifyListeners();
  }
}