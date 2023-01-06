

import 'package:shared_preferences/shared_preferences.dart';

import '../api/api_server.dart';




class SharedPreference {

    static Future<void> saveIP() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('IP', ApiServer.Ip);
      // print(' ${ApiServer.Ip} save ok.');
      // await prefs.setInt('counter', counter);
    }
    static Future<void>loadIP() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      ApiServer.Ip = prefs.getString('IP') ?? ApiServer.Ip;
      // await prefs.setInt('counter', counter);
    }


}