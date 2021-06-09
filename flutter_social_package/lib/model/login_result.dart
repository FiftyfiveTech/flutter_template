enum LoginStatus { success, cancelled, failed, operationInProgress }

/// class to handle a login request
class LoginResult {
  /// contain status of a previous login request
  final LoginStatus status;

  /// contain a message when the login request fail
  final String? message;

  /// contain the access token information for the current session
  /// this will be null when the login request fail
  final String? accessToken;

  final String? userId;

  LoginResult(
      {required this.status, this.message, this.accessToken, this.userId});
}
