import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:google_sign_in/google_sign_in.dart';

class UserDataMapper {
  UserDataMapper();

  Map<dynamic, dynamic> _getUserData({required User user}) {
    Map<dynamic, dynamic> userDataMap = Map();

    if (user != null) {
      userDataMap = {
        "name": user.displayName,
        "email": user.email,
        "picture": user.photoURL,
        "userId": user.uid
      };
    } else {
      throw Exception("Unable to get google user data");
    }
    return userDataMap;
  }

  Future<Map<dynamic, dynamic>> getUser() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    Map<dynamic, dynamic> userMap = Map();
    if (kIsWeb) {
      GoogleAuthProvider authProvider = GoogleAuthProvider();

      try {
        final UserCredential userCredential =
            await auth.signInWithPopup(authProvider);

        User? user = userCredential.user;

        if (user != null) {
          userMap = _getUserData(user: user);
          userMap.putIfAbsent(
              "token", () => userCredential.credential!.token.toString());
          userMap.putIfAbsent("status", () => "success");
        }
      } catch (e) {
        throw Exception("Google auth provider : $e}");
      }
    } else {
      final GoogleSignIn googleSignIn = GoogleSignIn();

      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        print("*******GoogleSignInAccount*********");
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        try {
          final UserCredential userCredential =
              await auth.signInWithCredential(credential);

          User? user = userCredential.user;

          if (user != null) {
            userMap = _getUserData(user: user);
            userMap.putIfAbsent(
                "token", () => userCredential.credential!.token.toString());
            userMap.putIfAbsent("status", () => "success");
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'account-exists-with-different-credential') {
            throw Exception("account-exists-with-different-credential");
          } else if (e.code == 'invalid-credential') {
            throw Exception("invalid-credential");
          }
        } catch (e) {
          throw Exception("Firebase auth exception : $e}");
        }
      } else {
        print("*******GoogleSignInAccount NULL*********");
      }
    }
    return Future.value(userMap);
  }
}
