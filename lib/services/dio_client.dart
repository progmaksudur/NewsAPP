import 'dart:async';
import 'dart:convert';
import 'dart:io';


import 'package:dio/dio.dart';
import 'package:news_app_with_api/services/app_exceptions.dart';



class DioClient {

  static const int TIME_OUT_DURATION = 20;


  //GET
  Future<dynamic> get(String baseUrl, String api,{Map<String, dynamic>? queryParameters,Options? options,}) async {

    var uri = Uri.parse(baseUrl + api);
    try {
      var response = await Dio().get(baseUrl + api,queryParameters: queryParameters,options: options).timeout(const Duration(seconds: TIME_OUT_DURATION));
      return response;
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException('API not responded in time', uri.toString());
    }
  }


}