import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_package/avatar/avatar_letter.dart';
import 'package:flutter_social_package/enums/social_provider.dart';
import 'package:flutter_social_package/model/login_result.dart';
import 'package:flutter_social_package/model/user_profile.dart';
import 'package:flutter_social_package/social_auth/social_auth_impl.dart';
import 'package:flutter_template/app/bloc/auth/user_auth_bloc.dart';
import 'package:flutter_template/app/bloc/auth/user_auth_events.dart';
import 'package:flutter_template/app/bloc/auth/user_auth_state.dart';
import 'package:flutter_template/core/util/ui_helpers.dart';
import 'package:flutter_template/generated/l10n.dart';

class SocialPage extends StatefulWidget {
  static const String routeName = '/social_login';

  @override
  State<StatefulWidget> createState() => _SocialPageState();
}

class _SocialPageState extends State<SocialPage> {
  UserProfile? facebookUser;
  String? userName = "";
  String? picture = "";
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    if (facebookUser != null) {
      userName = facebookUser!.name;
      picture = facebookUser!.picture;
    }
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top: 50),
              child: Center(
                child: Column(
                  children: [
                    picture != null && picture!.isNotEmpty
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(160.0),
                            child: FadeInImage.assetNetwork(
                              placeholder: "assets/icon/user_avatar.png",
                              image: picture!,
                              width: 150,
                              height: 150,
                              imageErrorBuilder: (BuildContext context,
                                  Object y, StackTrace? z) {
                                if (userName != null && userName!.isNotEmpty) {
                                  return AvatarLetter(
                                    backgroundColor: Colors.blue,
                                    textColor: Colors.white,
                                    fontSize: 16,
                                    upperCase: true,
                                    numberLetters: 2,
                                    letterType: LetterType.Circular,
                                    text: userName!,
                                    backgroundColorHex: "#0000FF",
                                    textColorHex: "#ffffff",
                                  );
                                } else {
                                  return Container();
                                }
                              },
                            ),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(100.0),
                            child: Image.asset(
                              "assets/icon/user_avatar.png",
                              height: 90.0,
                              width: 90.0,
                            ),
                          ),
                    Container(
                      margin: EdgeInsets.only(left: 10, top: 10),
                      child: Text(
                        userName != null ? userName! : "",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30, left: 16, right: 16),
                      child: TextField(
                        controller: _userNameController,
                        decoration: new InputDecoration(
                            border: new OutlineInputBorder(
                                borderSide:
                                    new BorderSide(color: Colors.black12)),
                            hintText: 'Enter user name',
                            labelText: 'User Name'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30, left: 16, right: 16),
                      child: TextField(
                        controller: _passwordController,
                        decoration: new InputDecoration(
                            border: new OutlineInputBorder(
                                borderSide:
                                    new BorderSide(color: Colors.black12)),
                            hintText: 'Enter password',
                            labelText: 'password'),
                        obscureText: true,
                        obscuringCharacter: "*",
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: InkWell(
                        onTap: () {
                          _loginWithCredentials();
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black38,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width / 1.5,
                          ),
                          child: Center(
                            child: Text("Login"),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: InkWell(
                        onTap: () {
                          _handleSocialSignIn(Provider.Facebook);
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black38,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width / 1.5,
                          ),
                          child: Center(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Image.asset(
                                    "assets/icon/facebook.png",
                                    width: 20,
                                    height: 20,
                                  ),
                                ),
                                Text(
                                  S.of(context).sign_in_with_facebook,
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: InkWell(
                        onTap: () {
                          _handleSocialSignIn(Provider.Google);
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black38,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width / 1.5,
                          ),
                          child: Center(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Image.asset(
                                    "assets/icon/google.png",
                                    width: 20,
                                    height: 20,
                                  ),
                                ),
                                Text(
                                  S.of(context).sign_in_with_google,
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    verticalSpaceMedium,
                    Container(
                      child: Center(
                        child: BlocBuilder<UserAuthBloc, UserAuthState>(
                          builder: (context, state) {
                            if (state is Loading) {
                              return Text("Wait signing in..");
                            } else if (state is Success) {
                              return Text("${_userNameController.text} is "
                                  "logged in now.");
                            } else if (state is Error) {
                              return Text("Invalid username or password");
                            } else {
                              return Container();
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _loginWithCredentials() {
    if (_userNameController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      BlocProvider.of<UserAuthBloc>(context).add(
        SignInWithCredentialEvent(
            _userNameController.text, _passwordController.text),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Fields can not be left blank"),
        ),
      );
    }
  }

  _handleSocialSignIn(Provider provider) async {
    SocialAuth(provider: provider).signInUser().then(
          (LoginResult? value) => {
            if (value != null)
              {
                SocialAuth(provider: provider)
                    .getUserData()
                    .then((userData) => {
                          setState(
                            () {
                              facebookUser = userData;
                            },
                          )
                        })
              }
          },
        );
  }
}
