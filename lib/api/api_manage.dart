

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dp48_server_app/api/Response/response_get_data.dart';
import 'package:flutter/cupertino.dart';

import 'Response/response_common.dart';
import 'api_server.dart';

class ApiManage {
  // Dio dio ;

  // ApiManage({required this.dio});

  Future<ResponseGetData> getData() async {
    try{
      // server api
      var response = await ApiServer.getDio().get(ApiServer.getData);
      var responseGetData = ResponseGetData.fromJson(response.data);
      return responseGetData;
    }on DioError catch (e) {
      return Future.error(e);
    }catch (e) {
      print(e);
      return Future.error(e);
    }
  }

  Future<ResponseCommon> deleteData(int packet_id) async {
    try{
      var response = await ApiServer.getDio().delete(ApiServer.deleteData , queryParameters: { 'packet_id' : packet_id } );
      var responseCommon = ResponseCommon.fromJson(response.data);
      return responseCommon;
    }on DioError catch (e) {
      return Future.error(e);
    }catch (e) {
      print(e);
      return Future.error(e);
    }
  }

}
