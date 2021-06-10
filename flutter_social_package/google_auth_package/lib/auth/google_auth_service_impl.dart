import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_auth_package/mapper/user_data.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:social_auth_contract/auth/auth_service.dart';

class GoogleAuthServiceImpl implements AuthService {
  @override
  Future<Map> signInWithGoogle() async {
    return await UserDataMapper().getUser();
  }

  @override
  Future<void> logoutFromGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      if (!kIsWeb) {
        await googleSignIn.signOut();
      }
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print("google: error while signOut ${e.toString()}");
    }
  }

  @override
  Future<void> logoutFromFacebook() {
    throw UnimplementedError();
  }

  @override
  Future<Map> signInWithFacebook() {
    throw UnimplementedError();
  }
}
