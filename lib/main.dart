import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sams/screens/home/home_screen.dart';
import 'package:sams/screens/login/login_screen.dart';
import 'package:sams/screens/welcome/welcome_screen.dart';

import 'constants.dart';
import 'model/user_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<UserModel>(
          create: (context) => UserModel(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Auth',
          theme: ThemeData(
            primaryColor: kPrimaryColor,
            scaffoldBackgroundColor: Colors.white,
          ),
          // home: HomeScreen(),
          home: LoginScreen(),
        )
    );
  }
}
