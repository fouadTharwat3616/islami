import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/settings/settings_provider.dart';
import 'package:provider/provider.dart';
class SebhaTap extends StatefulWidget {
  @override
  State<SebhaTap> createState() => _SebhaTapState();
}

class _SebhaTapState extends State<SebhaTap> {
  ThemeMode themeMode = ThemeMode.light;
  List<String> azqar = [
    'سبحان الله', 'الحمد لله', 'لا إله إلا الله',
    'الله أكبر', 'لا حولَ ولا قوةَ إلا بالله العلي العظيم',
  ];
  String counter = '0';
  int counter_string = 0;
  int index = 0;
  double turns=0.0;

  @override
  Widget build(BuildContext context) {
    changeText();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () {
            counter_string++;
            counter = counter_string.toString();
            setState(() => turns+= 1/34);
          },
          child: AnimatedRotation(
            turns: turns,
            duration: Duration(seconds: 1),
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: MediaQuery
                    .of(context)
                    .size
                    .width * .2),
                child: Image.asset('assets/images/${Provider
                    .of<settingsProvider>(context)
                    .sebha}')
            ),
          ),
        ),
        Text('عدد التسبيحات',
          style: Theme
              .of(context)
              .textTheme
              .bodyLarge,
          textAlign: TextAlign.center,
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
          decoration: BoxDecoration(
              color: Provider
                  .of<settingsProvider>(context)
                  .sebha_container_text
                  .withOpacity(.7),
              borderRadius: BorderRadius.circular(20)
          ),
          child: Text(counter,
            style: Theme
                .of(context)
                .textTheme
                .bodyLarge,
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          decoration: BoxDecoration(
            color: Provider
                .of<settingsProvider>(context)
                .azqar_bk_color,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Text(
            azqar[index],
            style: Theme
                .of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(
              color: Provider
                  .of<settingsProvider>(context)
                  .sebha_text,
            ),
            textAlign: TextAlign.center,
          ),
        ),


      ],
    );
  }

  void changeText() {
    if (counter_string == 34) {
      counter = '0';
      counter_string = 0;
      index++;
    }
    if (index == azqar.length) {
      index = 0;
    }
  }
}