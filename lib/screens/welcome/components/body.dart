import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sams/components/rounded_button.dart';
import 'package:sams/screens/login/login_screen.dart';
import 'package:sams/screens/signup/signup_screen.dart';

import '../../../constants.dart';
import 'background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "WELCOME TO EDU",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.05),
            SvgPicture.asset(
              "assets/icons/chat.svg",
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.05),
            Container(
              margin: EdgeInsets.all(25),
              child: ElevatedButton(
                child: Text('Log In', style: TextStyle(fontSize: 20.0),),
                style: ElevatedButton.styleFrom(
                  primary: kPrimaryColor,
                  minimumSize: Size(150, 50),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                },
              ),
            ),
            Container(
              // margin: EdgeInsets.all(25),
              child: ElevatedButton(
                child: Text('Sign Up', style: TextStyle(fontSize: 20.0),),
                style: ElevatedButton.styleFrom(
                  primary: kPrimaryColor,
                  minimumSize: Size(150, 50),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
