import 'package:facebook_auth_package/mapper/facebook_service.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookAuthMapper implements IFacebookService {
  FacebookAuthMapper();

  @override
  Map<dynamic, dynamic>? getLoginResult(LoginResult? result) {
    if (result != null) {
      return mapFbTokenToAccessToken(result);
    }
  }

  Map<dynamic, dynamic> mapFbTokenToAccessToken(LoginResult result) {
    Map<dynamic, dynamic> resultMap = Map();

    switch (result.status) {
      case LoginStatus.success:
        resultMap = {
          "token": result.accessToken!.token,
          "message": result.message,
          "status": getLoginStatus(result.status),
          "userId": result.accessToken!.userId,
          "isExpired": result.accessToken!.isExpired
        };
        break;
      default:
        resultMap = {
          "message": result.message,
          "status": getLoginStatus(result.status),
        };
        break;
    }
    return resultMap;
  }

  String getLoginStatus(LoginStatus loginStatus) {
    switch (loginStatus) {
      case LoginStatus.success:
        return "success";

      case LoginStatus.failed:
        return "failed";

      case LoginStatus.cancelled:
        return "cancelled";

      case LoginStatus.operationInProgress:
        return "operationInProgress";

      default:
        return "unknown";
    }
  }
}
