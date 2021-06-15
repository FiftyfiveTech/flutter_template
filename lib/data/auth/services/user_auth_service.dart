import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/error/failure.dart';

class UserAuthService {
  Future<Either<Failure, bool>> signInUserWithCredentials(
      String userName, String password) async {
    // TODO replace with actual service call.
    return Right(true);
  }
}
