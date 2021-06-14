import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class UserAuthState extends Equatable {
  UserAuthState([List props = const <dynamic>[]]) : super();
}

class InitState extends UserAuthState {
  @override
  List<Object?> get props => [];
}

class Loading extends UserAuthState {
  @override
  List<Object?> get props => [];
}

class Success extends UserAuthState {
  final bool isLoggedIn;

  Success({required this.isLoggedIn});

  @override
  List<Object?> get props => [this.isLoggedIn];
}

class Error extends UserAuthState {
  final String errorMessage;

  Error({required this.errorMessage});

  @override
  List<Object?> get props => [this.errorMessage];
}
