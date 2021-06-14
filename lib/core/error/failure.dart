import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  Failure(this.message);

  @override
  List<Object> get props => [message];
}

// General failures
class ServerFailure extends Failure {
  ServerFailure(String message, int errorCode) : super(message);
}

class NetworkFailure extends Failure {
  // TODO need to update or localize this message.
  static const String msg = "Some problem with your internet connectivity";

  NetworkFailure() : super(msg);
}
