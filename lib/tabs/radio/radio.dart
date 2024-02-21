import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/settings/settings_provider.dart';
import 'package:provider/provider.dart';
class RadioTap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset('assets/images/radio_image.png'),
        Text('إذاعة القرآن الكريم',
        style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
       Row(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: [
         // Icon(Icons.skip_previous,color: appTheme.primaryLight,size: 50),
         // Icon(Icons.play_arrow_rounded,color: appTheme.primaryLight,size: 50,),
         // Icon(Icons.skip_next , color: appTheme.primaryLight,size: 50,),
           IconButton(
               onPressed: (){

           },
             icon: Icon(Icons.skip_previous ,
               color: Provider.of<settingsProvider>(context).radio_icons,size: 50),
           ),
           IconButton(
             onPressed: (){

             },
             icon: Icon(Icons.play_arrow_rounded , color: Provider.of<settingsProvider>(context).radio_icons,size: 50,),
           ),
           IconButton(
             onPressed: (){

             },
             icon: Icon(Icons.skip_next , color: Provider.of<settingsProvider>(context).radio_icons,size: 50,),
           )
       ],
       )



      ],
    );
  }
}
