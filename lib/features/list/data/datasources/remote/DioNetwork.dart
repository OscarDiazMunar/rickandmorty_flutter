import 'package:dio/dio.dart';

import '../../../../../core/utils/Constants/network_constants.dart';

class DioNetwork {
  static late Dio appApi;

  static void initDio(){
    appApi = Dio(baseOptions(baseUrl));
  }

  static BaseOptions baseOptions(String baseUrl){
    return BaseOptions(
      baseUrl: baseUrl,
      responseType: ResponseType.json
    );
  }
}