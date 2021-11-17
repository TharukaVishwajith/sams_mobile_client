import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sams/bloc/auth_bloc.dart';
import 'package:sams/components/already_have_an_account_acheck.dart';
import 'package:sams/components/rounded_button.dart';
import 'package:sams/components/rounded_input_field.dart';
import 'package:sams/components/rounded_password_field.dart';
import 'package:sams/model/login_model.dart';
import 'package:sams/model/staff_model.dart';
import 'package:sams/screens/home/home_screen.dart';
import 'package:sams/screens/signup/signup_screen.dart';
import 'package:sams/secure_store.dart';
import 'package:sams/service/api_service.dart';
import 'package:sams/service/user_service.dart';
import 'package:provider/provider.dart';


import 'background.dart';

class Body extends StatelessWidget {
  final LoginRequestModel loginRequestModel =
      new LoginRequestModel(password: "", email: "");

  Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {
                loginRequestModel.email = value;
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                loginRequestModel.password = value;
              },
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                APIService apiService = APIService();
                apiService.login(loginRequestModel).then((value) {
                  debugPrint('value: $value');
                  String s = value.token;
                  print(value.staffId);
                  print(value.useName);
                  debugPrint('value: $s');
                  if (value != null) {
                    if (value.token.isNotEmpty) {
                      final snackBar =
                          SnackBar(content: Text("Login Successful"));
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    } else {
                      final snackBar = SnackBar(content: Text(value.error));
                    }
                  }
                });
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  _loadStaffDetails(BuildContext context,int staffId) {
    APIService().getStaff(staffId).then((value) {
      context.read<AuthBloc>().add(Login());
      UserService().updateLoggedUser(value);
    });
  }
}


