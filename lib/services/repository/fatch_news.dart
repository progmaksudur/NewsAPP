


import 'package:dio/dio.dart';
import 'package:news_app_with_api/const/app_strings.dart';
import 'package:news_app_with_api/services/dio_client.dart';


class GetNewsRepo{
  final DioClient dioClient;

  GetNewsRepo({required this.dioClient});

  Future<dynamic> getNews()async{
    try{
      Response response = await dioClient.get(APP_BASE_URL, APP_API_KEY);
      if(response.statusCode==200){
        return response;
      }
    }catch(error){
      throw error.toString();
    }


  }

}