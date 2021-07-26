import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:domain/authorization.dart';
import 'package:flutter_template/app/bloc/auth/user_auth_events.dart';
import 'package:flutter_template/app/bloc/auth/user_auth_state.dart';

class UserAuthBloc extends Bloc<UserAuthEvents, UserAuthState> {
  final SignInUserWithCredentials signInUserWithCredentials;
  static const String AUTH_ERROR_MESSAGE = "Something went wrong";

  UserAuthBloc(this.signInUserWithCredentials) : super(InitState());

  @override
  Stream<UserAuthState> mapEventToState(UserAuthEvents event) async* {
    if (event is SignInWithCredentialEvent) {
      yield Loading();
      var response = await signInUserWithCredentials.call(
        Params(userName: event.userName, password: event.password),
      );
      yield response.fold(
        (error) => Error(errorMessage: AUTH_ERROR_MESSAGE),
        (success) => Success(isLoggedIn: true),
      );
    }
  }
}
