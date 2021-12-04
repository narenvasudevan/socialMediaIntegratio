import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;
import 'login.dart';

void main() => runApp(kFacebook());

// ignore: camel_case_types
class kFacebook extends StatefulWidget {
  @override
  kFacebookState createState() => kFacebookState();
}

// ignore: camel_case_types
class kFacebookState extends State<kFacebook> {
  bool _isLoggedIn = false;
  Map userProfile;
  final facebookLogin = FacebookLogin();

  _loginWithFB() async {
    final result = await facebookLogin.logInWithReadPermissions(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final token = result.accessToken.token;
        final graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=$token');
        final profile = JSON.jsonDecode(graphResponse.body);
        print(profile);
        setState(() {
          userProfile = profile;
          _isLoggedIn = true;
        });
        break;

      case FacebookLoginStatus.cancelledByUser:
        setState(() => _isLoggedIn = false);
        break;
      case FacebookLoginStatus.error:
        setState(() => _isLoggedIn = false);
        break;
    }
  }

  _logout() {
    facebookLogin.logOut();
    setState(() {
      _isLoggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
            child: _isLoggedIn
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.network(
                        userProfile["picture"]["data"]["url"],
                        height: 400.0,
                        width: 400.0,
                      ),
                      Text('Name: ${userProfile["name"]}'),
                      Text('Email: ${userProfile["email"]}'),
                      // ignore: deprecated_member_use
                      OutlineButton(
                        child: Text("Logout"),
                        onPressed: () {
                          _logout();
                        },
                      )
                    ],
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // ignore: deprecated_member_use
                        RaisedButton(
                          child: Text(
                            'Login with Facebook',
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.indigo,
                            ),
                          ),
                          onPressed: () {
                            _loginWithFB();
                          },
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        // ignore: deprecated_member_use
                        RaisedButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Login();
                            }));
                          },
                          child: Text(
                            'Go Back to Home',
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.indigo,
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
      ),
    );
  }
}
