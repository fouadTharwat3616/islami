import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/home_screen.dart';
import 'package:islami/tabs/quran/sura_details_screen.dart';
import 'package:islami/tabs/hadeth/hadeth_details_screen.dart';
import 'package:islami/tabs/settings/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(Islami());
}

class Islami extends StatefulWidget {
  @override
  State<Islami> createState() => _IslamiState();
}

class _IslamiState extends State<Islami> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => settingsProvider(),
      child: Builder(
          builder: (ctx) =>  MaterialApp(
          debugShowCheckedModeBanner: false,
            routes: {
            HomeScreen.routeName:(_) => HomeScreen(),
              suraDetails.routeName:(_) => suraDetails(),
              HadethDetails.routeName:(_) => HadethDetails(),
            },
          theme: appTheme.lightTheme,
          darkTheme: appTheme.darkTheme,
          themeMode: Provider.of<settingsProvider>(ctx).themeMode,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales:AppLocalizations.supportedLocales,
           locale: Locale(Provider.of<settingsProvider>(ctx).languag),
            initialRoute:HomeScreen.routeName ,
        ),
      ),
    );
  }
}


