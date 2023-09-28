import 'package:dartz/dartz.dart';
import 'package:mvvm_restaurant_project/domain/models/Authentication.dart';

import '../../data/network/failure.dart';
import '../../data/request/request.dart';

abstract class Repository {

  Future<Either<Failure , Authentication>> login(LoginRequest loginRequest);
}
 