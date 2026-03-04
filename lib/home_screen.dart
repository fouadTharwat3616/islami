import 'package:flutter/material.dart';
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

  const HomeScreen({super.key});

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
          elevation: 0,
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
            items:  [
              BottomNavigationBarItem(
                  icon:const ImageIcon(
                      AssetImage('assets/images/icon_quran.png')
                  ),
                  label: AppLocalizations.of(context)?.quran ),
           BottomNavigationBarItem(
              icon:const ImageIcon(
                  AssetImage('assets/images/icon_hadeth.png')),
              label: AppLocalizations.of(context)?.hadeth ),
              BottomNavigationBarItem(
                  icon:const ImageIcon(
                      AssetImage('assets/images/icon_sebha.png')),
                  label: AppLocalizations.of(context)?.sebha ),

              BottomNavigationBarItem(
                  icon:const ImageIcon(
                      AssetImage('assets/images/icon_radio.png')),
                  label: AppLocalizations.of(context)?.radio ),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.settings_outlined),
                  label: AppLocalizations.of(context)?.settings )
        ],
          type: BottomNavigationBarType.fixed,
        ) ,

      ),
    );
  }
}
