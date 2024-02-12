import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/home_screen.dart';
import 'package:islami/tabs/quran/sura_details_screen.dart';
import 'package:islami/tabs/hadeth/hadeth_details_screen.dart';

void main() {
  runApp(Islami());
}

class Islami extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        routes: {
        HomeScreen.routeName:(_) => HomeScreen(),
          suraDetails.routeName:(_) => suraDetails(),
          HadethDetails.routeName:(_) => HadethDetails(),
        },
      theme: appTheme.lightTheme,
      darkTheme: appTheme.darkTheme,
      themeMode: ThemeMode.light,
        initialRoute:HomeScreen.routeName ,
    );
  }
}

