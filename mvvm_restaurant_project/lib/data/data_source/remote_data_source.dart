import 'package:mvvm_restaurant_project/data/network/app_api.dart';
import 'package:mvvm_restaurant_project/data/request/request.dart';
import 'package:mvvm_restaurant_project/data/responses/responses.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);
}

class RemoteDataSourceImplementer implements RemoteDataSource {
  AppServiceClient _appServiceClient;
  RemoteDataSourceImplementer(this._appServiceClient);

  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async {
    //TODO : implement login

    return await _appServiceClient.login(loginRequest.email,loginRequest.password,loginRequest.imei,loginRequest.device);
  }
}
