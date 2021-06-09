import 'package:google_auth_package/mapper/user_data.dart';
import 'package:social_auth_contract/user/user_service.dart';

class UserImpl implements UserService {
  @override
  Future<Map> getGoogleUser() async {
    return await UserDataMapper().getUser();
  }

  @override
  Future<Map> getFacebookUser() {
    throw UnimplementedError();
  }
}
