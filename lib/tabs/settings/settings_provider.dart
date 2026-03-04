import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
class settingsProvider with ChangeNotifier
{
  ThemeMode themeMode =ThemeMode.light;
  String languag = 'en';
  SharedPreferences? sharedPreferences;



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

  void changeTheme(ThemeMode selectedTheme)async{
    if(selectedTheme == themeMode) {
      return;
    }
    themeMode = selectedTheme;
    await saveTheme(selectedTheme);

    notifyListeners();

  }

  void changeLanguage(String selectedLanguage){
    if(selectedLanguage == languag) {
      return;
    }
    languag = selectedLanguage;
    saveLanguage(selectedLanguage);

    notifyListeners();
  }

Future<void> saveTheme(ThemeMode themeMode)async
{
  String newTheme= themeMode==ThemeMode.dark? 'dark':'light';
  await sharedPreferences!.setString('theme', newTheme);
}

String? getTheme()
{
  return sharedPreferences!.getString('theme');
}

Future<void> loadThemeData()async
{

  String? oldTheme=getTheme();
  if(oldTheme!=null)
    {
      themeMode= oldTheme=='dark'?ThemeMode.dark:ThemeMode.light;
    }
  notifyListeners();

}

Future<void> saveLanguage(String lang)async
{
  await sharedPreferences!.setString('lang', lang);
}

String? getLanguage()
{
  return sharedPreferences!.getString('lang');
}

Future<void> loadLanguage() async
{

  String? oldLang= getLanguage();
  if(oldLang != null)
    {
      languag = oldLang;
      notifyListeners();
    }
}

Future<void> initSettings()async
{
  sharedPreferences =await SharedPreferences.getInstance();
  await loadThemeData();
  await loadLanguage();
}


}