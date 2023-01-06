import 'package:dio/dio.dart';

class ApiServer {

  static String? token = "";
  static String Ip = "192.168.2.31";
  static String baseUrl = "http://${Ip}:2158";
  //172.20.10.5   192.168.2.31  192.168.10.229   192.168.100.5  http://210.71.166.49/   49.217.196.98    210.71.166.49
  // https://4a34-210-71-166-49.ngrok.io  https://ff3b-210-71-166-49.ngrok.io
  //POST

  //GET
  static const String getData = '/getData';

  static const String deleteData = '/deleteData';

  static setIP(){
    baseUrl = "http://${Ip}:2158";
  }
  static Map<String, dynamic> getHeaderMap() {
    return {"Content-Type":"application/json"};
  }
  static Map<String, dynamic> getTokenHeaderMap() {

    return {
      "Content-Type":"application/json",
      "Authorization":"Bearer $token"};

  }

  static Dio getTokenDio(){
    final dio = Dio();
    dio.options.baseUrl = ApiServer.baseUrl;
    dio.options.headers =  getTokenHeaderMap();
    dio.options.connectTimeout = 5000; //5s
    dio.options.receiveTimeout = 5000;
    return dio;
  }

  static Dio getDio(){
    final dio = Dio();
    // print(ApiServer.baseUrl);
    dio.options.baseUrl = ApiServer.baseUrl;
    dio.options.headers =  getHeaderMap();
    dio.options.connectTimeout = 5000; //5s
    dio.options.receiveTimeout = 5000;
    return dio;
  }
}