import 'package:facebook_auth_package/auth/facebook_auth_impl.dart';
import 'package:facebook_auth_package/user/user_impl.dart';
import 'package:flutter_social_package/enums/social_provider.dart';
import 'package:flutter_social_package/flutter_social_package.dart';
import 'package:flutter_social_package/model/login_result.dart';
import 'package:flutter_social_package/model/user_picture.dart';
import 'package:flutter_social_package/model/user_profile.dart';
import 'package:google_auth_package/auth/google_auth_service_impl.dart';

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
          return await _getLoginDetails(signInMap);
        } else {
          throw Exception("Unable to login user");
        }

      case Provider.Google:
        Map<dynamic, dynamic> signInMap =
            await GoogleAuthServiceImpl().signInWithGoogle();

        if (signInMap.isNotEmpty) {
          return await _getGoogleLoginResult(signInMap);
        } else {
          throw Exception("Unable to login user");
        }

      default:
        break;
    }
  }

  @override
  Future<UserProfile?> getUserData() async {
    switch (provider) {
      case Provider.Facebook:
        Map<dynamic, dynamic> userDataMap = await User().getFacebookUser();
        if (userDataMap.isNotEmpty) {
          print("User data found -> ${userDataMap.toString()}");
          return await _getUserProfile(userDataMap);
        } else {
          throw Exception("Unable to get user");
        }
        break;

      case Provider.Google:
        Map<dynamic, dynamic> userDataMap = await User().getGoogleUser();
        if (userDataMap.isNotEmpty) {
          print("User data found -> ${userDataMap.toString()}");
        } else {
          throw Exception("Unable to get user");
        }
        break;
      default:
        Future.value(null);
        break;
    }
  }

  @override
  Future<void> logOut() async {}

  Future<LoginResult?> _getLoginDetails(Map signInMap) async {
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

  Future<LoginResult?> _getGoogleLoginResult(
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

  Future<UserProfile?> _getUserProfile(Map userDataMap) {
    UserProfile userProfile = UserProfile(
      name: userDataMap["name"],
      email: userDataMap["email"],
      picture: userDataMap['picture'] is String
          ? userDataMap['picture']
          : Picture.fromJson(userDataMap['picture']).data?.url,
    );
    return Future.value(userProfile);
  }
}
