import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/loading_indicator.dart';
import 'package:islami/tabs/settings/settings_provider.dart';
import 'package:provider/provider.dart';

class suraDetails extends StatefulWidget {
  static const String routeName='sura_details-screen';

  @override
  State<suraDetails> createState() => _suraDetailsState();
}

class _suraDetailsState extends State<suraDetails> {
  List<String> ayat=[];

  @override
  Widget build(BuildContext context) {
    suraArgs Args=ModalRoute.of(context)!.settings.arguments as suraArgs;
    if(ayat.isEmpty)
      {
        loadSuraFile(Args.index);
      }
    //loadSuraFile(Args.index);
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
              Args.suraName
          ),
        ),
        body:
          ayat.isEmpty ?
          LoadingIndicator() :
        Container(
          decoration: BoxDecoration(
              color: Provider.of<settingsProvider>(context).container_sura_details_screen,
            borderRadius: BorderRadius.circular(25)
          ),
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width* .05,
            vertical: MediaQuery.of(context).size.width*.05
          ),
          child: ListView.builder(itemBuilder: (context, index) => Text(ayat[index],
            style: Theme.of(context).textTheme.titleMedium,
            textDirection: TextDirection.rtl,),
             itemCount: ayat.length,
      ),
        ),
    )
    )
    ;
  }

  Future<void> loadSuraFile(int index) async
  {
     String sura =  await rootBundle.loadString('assets/files/${index+1}.txt');
     ayat = sura.split('\n');
     setState(() {

     });
  }
}
class suraArgs{
  int index;
  String suraName;
  suraArgs(this.index,this.suraName);
}