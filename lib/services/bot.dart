import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

class Bot {
  static const String BOT_URL = "http://amigobotandmore.herokuapp.com/webhooks/rest/webhook";


  void getBotResponse() async{

    try{
     final response = await post(
       Uri.parse("http://theamigobot.herokuapp.com/webhooks/rest/webhook"),
       headers:<String, String>{
      'Content-Type': 'application/json',
      },
      body:jsonEncode(<String, String> {
         'sender':'22',
         'message': 'hello',
         
      })
     );
     
     print(response.body);
     List<dynamic> values=json.decode(response.body);
     print(values);
    }
    catch(er){}

     
   
  }



}