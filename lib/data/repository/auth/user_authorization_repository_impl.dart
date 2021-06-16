import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/error/failure.dart';
import 'package:flutter_template/data/authorization_impl.dart';
import 'package:flutter_template/domain/authorization.dart';

class UserAuthRepositoryImpl extends UserAuthRepository {
  final UserAuthService _service;

  UserAuthRepositoryImpl(this._service);

  @override
  Future<Either<Failure, bool>> signInUser(
      String userName, String password) async {
    print("user name: $userName and password: $password");
    var response = await _service.signInUserWithCredentials(userName, password);
    return response.fold((l) => left(l), (r) => right(r));
  }
}
