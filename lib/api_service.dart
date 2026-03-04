import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:islami/models/radio_model.dart';
class ApiService {
 static Future<List<Radios>?> getRadioData()async{
   try{
     Uri uri=Uri.https(
         'mp3quran.net',
         'api/v3/radios',
         {
           'language':'ar'
         }
     );
     final Response=await http.get(uri);
     final json= jsonDecode(Response.body);
     return RadioModel.fromJson(json).radios??[];
   }catch(error)
   {
     print(error);
     rethrow;
   }
 }

}