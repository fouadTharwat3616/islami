import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/hadeth/hadeth_data.dart';
import 'package:islami/tabs/settings/settings_provider.dart';
import 'package:provider/provider.dart';

class HadethDetails extends StatelessWidget {
  static const String routeName='hadeth_details-screen';
  @override
  Widget build(BuildContext context) {
    hadethData hadeth =ModalRoute.of(context)!.settings.arguments as hadethData;
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
               hadeth.title
            ),
          ),
          body:
          Container(
            decoration: BoxDecoration(
                color: Provider.of<settingsProvider>(context).container_hadeth_details_screen,
                borderRadius: BorderRadius.circular(25)
            ),
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width* .05,
                vertical: MediaQuery.of(context).size.width*.05
            ),
            child: ListView.builder(itemBuilder: (context, index) => Text(hadeth.content[index],
              style: Theme.of(context).textTheme.titleMedium
              ,
              textDirection: TextDirection.rtl,),
              itemCount: hadeth.content.length,
            ),
          ),
        )
    )
    ;
  }
}
