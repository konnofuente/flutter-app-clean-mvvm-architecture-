// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mvvm_restaurant_project/app/functions.dart';
import 'package:mvvm_restaurant_project/data/network/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:mvvm_restaurant_project/data/request/request.dart';
import 'package:mvvm_restaurant_project/domain/models/Authentication.dart';
import 'package:mvvm_restaurant_project/domain/models/device_info.dart';
import 'package:mvvm_restaurant_project/domain/repository/repository.dart';
import 'package:mvvm_restaurant_project/domain/use_case/base_use_case.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, Authentication> {
  Repository _repository;
  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, Authentication>> execute(
      LoginUseCaseInput input) async {

    DeviceInfo deviceInfo = await getDeviceDetails();

    return await _repository
        .login(LoginRequest(input.email, input.password, deviceInfo.identifier, deviceInfo.name));
  }
}

class LoginUseCaseInput {
  String email;
  String password;

  LoginUseCaseInput({
    required this.email,
    required this.password,
  });
}
