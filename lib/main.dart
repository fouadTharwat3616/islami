import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/home_screen.dart';
import 'package:islami/tabs/quran/sura_details_screen.dart';
import 'package:islami/tabs/hadeth/hadeth_details_screen.dart';
import 'package:islami/tabs/settings/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  var provider=settingsProvider();
  provider.initSettings();
  runApp(
      ChangeNotifierProvider(
          create: (BuildContext context) =>provider,
          child: Islami()
      )
  );
}

class Islami extends StatefulWidget {
  @override
  State<Islami> createState() => _IslamiState();
}

class _IslamiState extends State<Islami> {
  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
        debugShowCheckedModeBanner: false,
          routes: {
          HomeScreen.routeName:(_) => const HomeScreen(),
            suraDetails.routeName:(_) => suraDetails(),
            HadethDetails.routeName:(_) => HadethDetails(),
          },
        theme: appTheme.lightTheme,
        darkTheme: appTheme.darkTheme,
        themeMode: Provider.of<settingsProvider>(context).themeMode,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales:AppLocalizations.supportedLocales,
         locale: Locale(Provider.of<settingsProvider>(context).languag),
          initialRoute:HomeScreen.routeName ,

    );
  }
}


