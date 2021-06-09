import 'package:facebook_auth_package/auth/facebook_auth_impl.dart';
import 'package:facebook_auth_package/user/user_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_social_package/enums/social_provider.dart';
import 'package:flutter_social_package/flutter_social_package.dart';
import 'package:flutter_social_package/model/login_result.dart';
import 'package:google_auth_package/auth/google_auth_impl.dart';

class SocialAuth extends SocialAuthFactory {
  Provider provider;

  SocialAuth({required this.provider});

  @override
  Future<LoginResult?> signInUser() async {
    switch (provider) {
      case Provider.Facebook:
        Map<dynamic, dynamic> signInMap =
            await FacebookAuthServiceImpl().signInWithFacebook();
        if (signInMap.isNotEmpty) {
          print("Logged in successfully - > ${signInMap.toString()}");
          return await getLoginDetails(signInMap);
        } else {
          throw ErrorDescription("Unable to login user");
        }

      case Provider.Google:
        Map<dynamic, dynamic> signInMap =
            await GoogleAuthImpl().signInWithGoogle();

        if (signInMap.isNotEmpty) {
          print("Logged in successfully - > ${signInMap.toString()}");
          return await getGoogleLoginResult(signInMap);
        } else {
          throw ErrorDescription("Unable to login user");
        }

      default:
        break;
    }
  }

  @override
  Future<Map<String, dynamic>?> getUserData() async {
    switch (provider) {
      case Provider.Facebook:
        Map<dynamic, dynamic> userDataMap = await User().getFacebookUser();
        if (userDataMap.isNotEmpty) {
          print("User data found -> ${userDataMap.toString()}");
        } else {
          throw ErrorDescription("Unable to get user");
        }
        break;

      case Provider.Google:
        Map<dynamic, dynamic> userDataMap = await User().getGoogleUser();
        if (userDataMap.isNotEmpty) {
          print("User data found -> ${userDataMap.toString()}");
        } else {
          throw ErrorDescription("Unable to get user");
        }
        break;
      default:
        Future.value(null);
        break;
    }
  }

  @override
  Future<void> logOut() async {}

  Future<LoginResult?> getLoginDetails(Map signInMap) async {
    if (signInMap.containsKey("status")) {
      print("Login Status ---> ${signInMap["status"]}");
      if (signInMap["status"] == "success") {
        print("Success----> ${signInMap["userId"]}");
        LoginResult result = LoginResult(
            status: LoginStatus.success,
            message: signInMap["message"],
            userId: signInMap["userId"],
            accessToken: signInMap["token"]);
        return Future.value(result);
      } else if ((signInMap["status"] == "failed")) {
        print("Failure----> ${signInMap["message"]}");
        return Future.value(LoginResult(
            status: LoginStatus.failed, message: signInMap["message"]));
      } else if ((signInMap["status"] == "cancelled")) {
        print("cancelled----> ${signInMap["message"]}");
        return Future.value(LoginResult(
            status: LoginStatus.cancelled, message: signInMap["message"]));
      } else if ((signInMap["status"] == "operationInProgress")) {
        print("operationInProgress----> ${signInMap["message"]}");
        return Future.value(LoginResult(
            status: LoginStatus.operationInProgress,
            message: signInMap["message"]));
      }
    } else {
      print("***Return with null***");
      return Future.value(null);
    }
  }

  Future<LoginResult?> getGoogleLoginResult(
      Map<dynamic, dynamic> signInMap) async {
    if (signInMap.containsKey("status")) {
      print("Login Status ---> ${signInMap["status"]}");
      if (signInMap["status"] == "success") {
        print("Success----> ${signInMap["userId"]}");
        LoginResult result = LoginResult(
            status: LoginStatus.success,
            userId: signInMap["userId"],
            accessToken: signInMap["token"]);
        return Future.value(result);
      }
    }
  }
}
