library flutter_social_package;

import 'dart:core';

import 'package:flutter_social_package/model/login_result.dart';

abstract class SocialAuthFactory {
  Future<LoginResult?> signInUser();

  Future<Map<String, dynamic>?> getUserData();

  /// Sign Out from social app
  Future<void> logOut();
}
