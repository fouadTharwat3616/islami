import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:islami/api_service.dart';
import 'package:islami/models/radio_model.dart';

class RadioProvider with ChangeNotifier{
  List<Radios> data=[];
  final player = AudioPlayer();
  getRadioData()async{
    data =(await ApiService.getRadioData())!;
    notifyListeners(

    );
  }
  playAudio(int index)async{
    await player.play(UrlSource(data[index].url??''));
    notifyListeners();
  }
  pauseAudio(){
    player.pause();
    notifyListeners();
  }

}