import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:core/error/failure.dart';
import 'package:core/usecase.dart';
import 'package:domain/authorization.dart';

class SignInUserWithCredentials implements UseCase<bool, Params> {
  final UserAuthRepository _repository;

  SignInUserWithCredentials(this._repository);

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await _repository.signInUser(params.userName, params.password);
  }
}

class Params extends Equatable {
  final String userName;
  final String password;

  Params({required this.userName, required this.password});

  @override
  List<Object?> get props => [userName, password];
}
