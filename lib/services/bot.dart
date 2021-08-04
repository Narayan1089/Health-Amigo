import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

class Button{
   String payload;
   String title;

  Button({
    required this.payload,
    required this.title
  });

  factory Button.fromJson(Map<String, dynamic> json) {
    return Button(
      payload: json["payload"] as String,
      title: json["title"] as String,
    );
  }
}

class BotResponse{
  String recipient_id;
  String text;

  BotResponse({required this.recipient_id, required this.text});

  factory BotResponse.fromJson(Map<String, dynamic> json) {
    return BotResponse(
      recipient_id: json['recipient_id'],
      text: json['text'],
    );
  }
}


class Bot {

  late List<BotResponse> list;

  Future<List<BotResponse>> getBotResponse(String senderId, String message) async{

    try{
     final response = await post(
       Uri.parse("http://a8c85ef5a244.ngrok.io/webhooks/rest/webhook"),
       headers:<String, String>{
      'Content-Type': 'application/json',
      },
      body:jsonEncode(<String, String> {
         'sender': senderId,
         'message': message,
         
      })
     );

    if (response.statusCode == 200) {

      print(response.body);
      var data = json.decode(response.body);
      var rest = data as List;

      list = rest.map<BotResponse>((json) => BotResponse.fromJson(json)).toList();
      print(list);
      //  print(response.body);
      //  List<dynamic> values=json.decode(response.body);

      return list;
    }
    else{
      print('else');
      list = [BotResponse(recipient_id: "",text: "Sorry, There was some error.")];
      return list;
      
    }
    //  print(values);
    }
    catch(er){
      print('exception');
      throw Exception('Failed to load messages.');
    }

     
   
  }



}