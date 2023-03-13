import 'dart:convert';
import 'dart:developer';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:task_manager/data/auth_utils.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/main.dart';
import 'package:task_manager/ui/screens/login.dart';

class networkData {
  /*
   * This is http Get Method
   */
  static Future<dynamic> getMethod(String url,
      {VoidCallback? onUnauthorized}) async {
    try {
      http.Response response = await http.get(Uri.parse(url), headers: {
        "Content-Type": "application/json",
        "token": AuthUtils.token ?? ''
      });
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 401) {
        if (onUnauthorized != null) {
          onUnauthorized();
        }else{
          moveToLogin();
        }
      } else {
        log('Internal Network error');
      }
    } catch (e) {
      log("Error $e");
    }
  }

  /*
   * This is http Post Method
   */
  static Future<dynamic> postMethod(String url,
      {Map<String, String>? bodyData,
      VoidCallback? onUnauthorized
      }) async {
    try {
      http.Response response = await http.post(Uri.parse(url),
          headers: {"Content-Type": "application/json", "token": AuthUtils.token ?? ''},
          body: jsonEncode(bodyData));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 401) {
        if (onUnauthorized != null) {
          onUnauthorized();
        }else{
          moveToLogin();
        }
      } else {
        log('Internal Network error');
      }
    } catch (e) {
      log("Error $e");
    }
  }

  static void moveToLogin() async{
    await AuthUtils.clearAuthData();
    // Navigator.push
    Navigator.pushAndRemoveUntil(
        TaskManagerApp.globalKey.currentContext!,
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (route) => false);
  }
}
