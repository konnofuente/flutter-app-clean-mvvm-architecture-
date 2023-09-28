// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mvvm_restaurant_project/data/data_source/remote_data_source.dart';
import 'package:mvvm_restaurant_project/data/mapper/mapper.dart';
import 'package:mvvm_restaurant_project/data/network/error_handler.dart';
import 'package:mvvm_restaurant_project/data/network/failure.dart';
import 'package:mvvm_restaurant_project/data/network/network_info.dart';
import 'package:mvvm_restaurant_project/data/request/request.dart';
import 'package:mvvm_restaurant_project/domain/models/Authentication.dart';
import 'package:mvvm_restaurant_project/domain/repository/repository.dart';
import 'package:mvvm_restaurant_project/presentation/resources/export_app_manager.dart';

class RepositoryImplt extends Repository {
  RemoteDataSource _remoteDataSource;
  NetworkInfo _networkInfo;

  RepositoryImplt(
    this._remoteDataSource,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    final response = await _remoteDataSource.login(loginRequest);

    if (!await _networkInfo.isConnected) {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }

    try {
      return response.status == ApiInternalStatus.SUCCESS
          ? Right(response.toDomain())
          : Left(Failure(code: response.status ?? ApiInternalStatus.FAILURE, message: response.message.toString() ?? ResponseMessage.DEFAULT));
    } catch (e) {
      return (Left(ErrorHandler.handle(e).failure));
    }
  }
}
