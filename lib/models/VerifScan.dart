import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'dart:async';
import 'package:organiz/HomeView.dart';

class VerifEngine {

  static var idUser = 3;
  static String host = "https://organiz.online/android/orders";
  //static String host = "http://192.168.43.4:5000/orders";
  static var API = {"orders": "orders"};

  static Future<http.Response> sendQrNum(var context, int numero) async {
    Map<String, dynamic> body = {'idUser':idUser, 'idOrder':numero};
    //Map<String, dynamic> body = {'id':1};
    http.Response response = null;
    try{
      startProgressBar(context, "verification en cour...");
      response = await  http.post("$host", body: body);
      toaster(context, "Response: ${response.body}");
    }on Exception catch(e){
      toaster(context, "Impossible de se connecter au server");
    }
    return response;
  }


  void getUserInfo(){

  }

  void setUserState(){
      
  }

}