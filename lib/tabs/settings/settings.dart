import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/settings/settings.dart';
import 'package:islami/tabs/settings/settings.dart';
import 'package:islami/tabs/settings/settings_provider.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  List<language> languages=[language(name: 'English', code: 'en'),language(name: 'العربية', code: 'ar')];
  @override
  Widget build(BuildContext context) {
    settingsProvider provider= Provider.of<settingsProvider>(context);
    return Column(
      children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Dark Mode',
            style: Theme.of(context).textTheme.titleMedium?.copyWith( color: Provider.of<settingsProvider>(context).settings_text),),
            Switch(
                value:  provider.themeMode==ThemeMode.dark,
                onChanged:(value){
                  if(value){
                    provider.changeTheme(ThemeMode.dark);
                  }
                  else {
                    provider.changeTheme(ThemeMode.light);
                  }
                },
              activeTrackColor: Theme.of(context).primaryColor,
              inactiveTrackColor: Theme.of(context).primaryColor,
              thumbColor: MaterialStatePropertyAll(appTheme.white),
                )
          ],
        ),
      ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text('Language',
            style: Theme.of(context).textTheme.titleMedium?.copyWith( color: Provider.of<settingsProvider>(context).settings_text),),
          SizedBox(
            width: MediaQuery.of(context).size.width*.3,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<language>(
                value: languages.firstWhere((lang) => lang.code==provider.languag) ,
                  items: languages.map(
                          (language) => DropdownMenuItem(
                            value: language,
                      child: Text(language.name,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith( color: Provider.of<settingsProvider>(context).settings_text),
                      ),
                  )
                  ).toList(),
                  onChanged: (selectedLanguage){
                  if(selectedLanguage !=null)
                    {
                      provider.changeLanguage(selectedLanguage.code);
                    }
                  setState(() {

                  });
                  },
                borderRadius: BorderRadius.circular(20),
                  ),

            ),
          )
        ],)
    ],
    );
  }
}

class language
{
  String name;
  String code;
  language({required this.name,required this.code});
}
