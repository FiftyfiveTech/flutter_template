library facebook_auth_package;

import 'package:facebook_auth_package/mapper/facebook_auth_mapping.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:social_auth_contract/auth/auth_service.dart';

class FacebookAuthServiceImpl implements AuthService {
  FacebookAuthServiceImpl();

  @override
  Future<Map<dynamic, dynamic>> signInWithFacebook() async {
    LoginResult loginResult = await FacebookAuth.instance.login();
    return Future.value(FacebookAuthMapper().getLoginResult(loginResult));
  }

  @override
  Future<void> logoutFromFacebook() async {
    FacebookAuth.instance.logOut();
  }

  @override
  Future<void> logoutFromGoogle() {
    throw UnimplementedError();
  }

  @override
  Future<Map> signInWithGoogle() {
    throw UnimplementedError();
  }
}
