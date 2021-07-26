import 'package:flutter_template/app/bloc/auth/user_auth_bloc.dart';
import 'package:data/authorization_impl.dart';
import 'package:domain/authorization.dart';
import 'package:get_it/get_it.dart';

final instance = GetIt.instance;

Future<void> initLocator() async {
// User authorization object initialization
  instance.registerLazySingleton(
    () => SignInUserWithCredentials(
      instance(),
    ),
  );
  instance.registerLazySingleton<UserAuthRepository>(
    () => UserAuthRepositoryImpl(
      instance(),
    ),
  );
  instance.registerLazySingleton(
    () => UserAuthService(),
  );

  instance.registerFactory(
    () => UserAuthBloc(instance()),
  );
}
