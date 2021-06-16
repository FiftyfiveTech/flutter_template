import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/error/failure.dart';

class UserAuthService {
  Future<Either<Failure, bool>> signInUserWithCredentials(
      String userName, String password) async {
    // TODO replace with actual service call.
    if (userName == "Abhay" && password == "12345")
      return Right(true);
    else
      return Left(ServerFailure("Wrong username or password", 101));
  }
}
