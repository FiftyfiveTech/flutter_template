import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class UserAuthEvents extends Equatable {
  UserAuthEvents([List props = const <dynamic>[]]) : super();
}

@immutable
class SignInWithCredentialEvent extends UserAuthEvents {
  final String userName;
  final String password;

  SignInWithCredentialEvent(this.userName, this.password);

  @override
  List<Object?> get props => [];
}
