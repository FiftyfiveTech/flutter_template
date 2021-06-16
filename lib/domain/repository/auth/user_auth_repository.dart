import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/error/failure.dart';

abstract class UserAuthRepository {
  Future<Either<Failure, bool>> signInUser(String userName, String password);
}
