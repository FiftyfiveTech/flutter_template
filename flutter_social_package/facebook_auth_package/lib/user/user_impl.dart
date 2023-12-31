import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:social_auth_contract/user/user_service.dart';

class FacebookUserImpl implements UserService {
  Future<Map<dynamic, dynamic>> getFacebookUser() async {
    Map<dynamic, dynamic> userData = await FacebookAuth.instance.getUserData(
        fields: "name,email,"
            "picture.width(100)");
    return Future.value(userData);
  }

  @override
  Future<Map> getGoogleUser() {
    throw UnimplementedError();
  }
}
