library flutter_social_package;

import 'dart:core';

import 'package:flutter_social_package/model/login_result.dart';
import 'package:flutter_social_package/model/user_profile.dart';

abstract class SocialAuthFactory {
  Future<LoginResult?> signInUser();

  Future<UserProfile?> getUserData();

  /// Sign Out from social app
  Future<void> logOut();
}
