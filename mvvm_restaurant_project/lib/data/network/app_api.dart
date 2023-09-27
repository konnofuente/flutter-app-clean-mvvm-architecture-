import 'package:dio/dio.dart';
import 'package:mvvm_restaurant_project/data/network/constant.dart';
import 'package:retrofit/http.dart';

import '../responses/responses.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: Constant.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST("/customer/login")
  Future<AuthenticationResponse> login();
}
