import 'package:dartz/dartz.dart';
import 'package:core/error/failure.dart';

abstract class UserAuthRepository {
  Future<Either<Failure, bool>> signInUser(String userName, String password);
}
