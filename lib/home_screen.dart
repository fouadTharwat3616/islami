import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/hadeth/hadeeth.dart';
import 'package:islami/tabs/quran/quran.dart';
import 'package:islami/tabs/radio/radio.dart';
import 'package:islami/tabs/sebha/sebha.dart';
import 'package:islami/tabs/settings/settings.dart';
import 'package:islami/tabs/settings/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class HomeScreen extends StatefulWidget {
  static const String routeName='HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs=[
    quranTap(),
  HadeethTap(),
  SebhaTap(),
    RadioTap(),
    Settings()
  ];
  int selected_index=0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/${Provider.of<settingsProvider>(context).backGroundName}.png'),
                  fit: BoxFit.cover
          )
      ),
      child: Scaffold(
        appBar: AppBar(
         title: Text(
          AppLocalizations.of(context)!.islami
         ),
        ),
        body: tabs[selected_index],

        bottomNavigationBar:
        BottomNavigationBar(
          currentIndex: selected_index,
          onTap: (index) {
            selected_index=index;
            setState(() {
            });
          },
            items: [
              BottomNavigationBarItem(
                  icon:ImageIcon(
                      AssetImage('assets/images/icon_quran.png')),
                  label: 'Quran' ),
          BottomNavigationBarItem(
              icon:ImageIcon(
                  AssetImage('assets/images/icon_hadeth.png')),
              label: 'Hadeth' ),
              BottomNavigationBarItem(
                  icon:ImageIcon(
                      AssetImage('assets/images/icon_sebha.png')),
                  label: 'Sebha' ),

              BottomNavigationBarItem(
                  icon:ImageIcon(
                      AssetImage('assets/images/icon_radio.png')),
                  label: 'Radio' ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings_outlined),
                  label: 'Settings' )
        ],
          type: BottomNavigationBarType.fixed,
        ) ,

      ),
    );
  }
}
