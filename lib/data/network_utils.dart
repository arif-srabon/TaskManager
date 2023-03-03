import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;

class networkData{
   /*
   * This is http Get Method
   */
  static Future<dynamic> getMethod(String url) async{
    try{
      http.Response response =  await http.get(Uri.parse(url));
      if(response.statusCode == 200){
        return jsonDecode(response.body);
      }else if(response.statusCode == 401){
        print("unauthorized");
      }else{
        print('Internal Network error');
      }
    }catch(e){
      print(e);
    }
  }

  /*
   * This is http Post Method
   */
  static Future<dynamic> postMethod(String url,{Map<String,String>? bodyData, VoidCallback? onUnauthorized,String? token}) async{
    try{
      http.Response response =  await http.post(
          Uri.parse(url),
          headers: {"Content-Type" : "application/json","token" : token ?? ''},
          body:jsonEncode(bodyData)
      );
      if(response.statusCode == 200){
        return jsonDecode(response.body);
      }else if(response.statusCode == 401){
        if(onUnauthorized != null){
          onUnauthorized();
        }

      }else{
        print('Internal Network error');
      }
    }catch(e){
      print(e);
    }
  }


}