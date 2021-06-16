import 'package:equatable/equatable.dart';

class SignIn extends Equatable {
  final String userName;
  final String password;

  SignIn({required this.userName, required this.password});

  @override
  List<String?> get props => [userName, password];
}
