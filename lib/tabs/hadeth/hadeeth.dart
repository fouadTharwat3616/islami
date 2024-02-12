import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/loading_indicator.dart';
import 'package:islami/tabs/hadeth/hadeth_data.dart';
import 'package:islami/tabs/hadeth/hadeth_details_screen.dart';

class HadeethTap extends StatefulWidget {
  @override
  State<HadeethTap> createState() => _HadeethTapState();
}

class _HadeethTapState extends State<HadeethTap> {
  List<hadethData> ahadeth=[];

  @override
  Widget build(BuildContext context) {
    if(ahadeth.isEmpty)
      {
        loadHadethFile();
      }
    return Column(
      //mainAxisAlignment: MainAxisAlignment.start,
      //crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset('assets/images/hadeth_logo.png'),
        Container(
          height: 4,
          width: double.infinity,
          color: appTheme.primaryLight,
          margin: EdgeInsets.only(bottom: 5),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('الأحاديث',style: Theme.of(context).textTheme.headlineSmall,),
          ],
        ),

        Container(
          height: 4,
          width: double.infinity,
          color: appTheme.primaryLight,
          margin: EdgeInsets.only(bottom: 5),
        ),
        Expanded(
          child:
          ahadeth.isEmpty ?
              LoadingIndicator():
          ListView.separated(itemBuilder: (context, index) =>
                InkWell(
                onTap: (){
                  Navigator.of(context).pushNamed(HadethDetails.routeName,
                  arguments: ahadeth[index]
                  );
                },
                child: Text(
                ahadeth[index].title,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
            ),
              ),
            itemCount: ahadeth.length,
            separatorBuilder:(context, index) => SizedBox(height: 8),
            ),
                ),
  ]
    );

  }

  Future<void> loadHadethFile() async
  {
    String ahadethFileContent =await rootBundle.loadString('assets/files/ahadeth.txt');
    //List<String> ahadethStrings=ahadethFileContent.split('#\r\n');
    List<String> ahadethStrings=ahadethFileContent.split('#');
    ahadeth = ahadethStrings.map((hadethString) {
      List<String> hadethLines= hadethString.trim().split('\n');
      String title=hadethLines[0];
      hadethLines.removeAt(0);
      List<String> content = hadethLines;
      return hadethData(title, content);
    } ).toList();
    setState(() {

    });

  }
}
