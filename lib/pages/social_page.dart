import 'package:flutter/material.dart';
import 'package:flutter_social_package/avatar/avatar_letter.dart';
import 'package:flutter_social_package/enums/social_provider.dart';
import 'package:flutter_social_package/model/login_result.dart';
import 'package:flutter_social_package/model/user_profile.dart';
import 'package:flutter_social_package/social_auth/social_auth_impl.dart';

class SocialPage extends StatefulWidget {
  static const String routeName = '/social_login';

  @override
  State<StatefulWidget> createState() => _SocialPageState();
}

class _SocialPageState extends State<SocialPage> {
  UserProfile? facebookUser;
  String? userName = "";
  String? picture = "";

  @override
  Widget build(BuildContext context) {
    if (facebookUser != null) {
      userName = facebookUser!.name;
      picture = facebookUser!.picture;
    }
    return Scaffold(
      body: SafeArea(
        child: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: Container(
            padding: EdgeInsets.only(top: 50),
            child: Center(
              child: Column(
                children: [
                  picture != null && picture!.isNotEmpty
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: FadeInImage.assetNetwork(
                            placeholder: "assets/icon/user_avatar.png",
                            image: picture!,
                            width: 100,
                            height: 100,
                            imageErrorBuilder: (BuildContext context, Object y,
                                StackTrace? z) {
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
                            borderRadius: BorderRadius.all(Radius.circular(5))),
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
                                "Sign in with Facebook",
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
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black38,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
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
                                "Sign in with Google",
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _handleSocialSignIn(Provider provider) async {
    SocialAuth(provider: provider).signInUser().then((LoginResult? value) => {
          if (value != null)
            {
              SocialAuth(provider: provider).getUserData().then((userData) => {
                    setState(() {
                      facebookUser = userData;
                    })
                  })
            }
        });
  }
}
