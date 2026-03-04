import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/radio/radio_provider.dart';
import 'package:islami/tabs/settings/settings_provider.dart';
import 'package:provider/provider.dart';

class RadioTap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => RadioProvider()..getRadioData(),
      child: Consumer<RadioProvider>(
        builder: (context,RadioProvider myProvider, child) {
          return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround ,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(child: Image.asset('assets/images/radio_image.png')),
                 //Align(alignment: Alignment.center, child: Text('إذاعة القرآن الكريم',style: Theme.of(context).textTheme.bodyLarge)),
                Expanded(
                  child: ListView.builder(
                    physics: const PageScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                      itemBuilder:(context, index) => Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children:[
                            Text(
                              myProvider.data[index].name!,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                          // Icon(Icons.skip_previous,color: appTheme.primaryLight,size: 50),
                          // Icon(Icons.play_arrow_rounded,color: appTheme.primaryLight,size: 50,),
                          // Icon(Icons.skip_next , color: appTheme.primaryLight,size: 50,),
                          IconButton(
                            onPressed: () {
                             myProvider.pauseAudio();
                            },
                            icon: Icon(
                              Icons.play_arrow_rounded,
                              color:
                              Provider.of<settingsProvider>(context).radio_icons,
                              size: 50,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              myProvider.playAudio(index);
                            },
                            icon: Icon(
                              Icons.pause,
                              color:
                              Provider.of<settingsProvider>(context).radio_icons,
                              size: 50,
                            ),
                          )
                    ],
                  )],
                        ),
                      ),
                    itemCount: myProvider.data.length,
                  ),
                )

              ]);
        },
      ),
    );
  }
}
