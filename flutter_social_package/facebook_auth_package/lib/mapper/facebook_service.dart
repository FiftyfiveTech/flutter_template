import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

abstract class IFacebookService {
  Map<dynamic, dynamic>? getLoginResult(LoginResult? fbLoginResult);
}
