import 'package:flutter/material.dart';
import 'my_flutter_app_icons.dart';
import 'facebook.dart';
import 'google.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Stack(
                  children: [
                    Text(
                      'Social Media',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 50.0,
                          fontFamily: 'BlackBruno'),
                    ),
                    Positioned(
                      top: 70.0,
                      child: Text(
                        'Integration',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 50.0,
                            fontFamily: 'BlackBruno'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              // ignore: deprecated_member_use
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(32.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return kFacebook();
                    }));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // SizedBox(
                        //   width: 10.0,
                        // ),
                        Icon(MyFlutterApp.google),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'Sign in using Facebook',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(32.0),
                    ),
                    primary: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return kGoogle();
                    }));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // SizedBox(
                        //   width: 10.0,
                        // ),
                        Icon(
                          MyFlutterApp.google,
                          color: Colors.black54,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'Sign in using Google  ',
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
