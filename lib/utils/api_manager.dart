import 'package:amiibo_list/model/amiibo_result.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'api_manager.g.dart';

@RestApi(baseUrl:"https://www.amiiboapi.com/api/")
abstract class ApiManager{

  factory ApiManager(Dio dio, {String baseUrl}){
    dio = Dio();
    return _ApiManager(dio, baseUrl: baseUrl);
  }

  @GET("amiibo/")
  Future <AmiiboResult> getAmiibo();

}