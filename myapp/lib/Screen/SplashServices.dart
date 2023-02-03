import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Screen/LoginScreen.dart';
import 'package:myapp/Screen/home.dart';

import 'SignUpScreen.dart';

class SplashServices {
  final FirebaseAuth auth = FirebaseAuth.instance;

  void isLogin(BuildContext context) {
    final user = auth.currentUser;
    if (user != null) {
      Timer(
          const Duration(
            seconds: 2,
          ),
          () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomeScreen())));
    } else {
      Timer(
          const Duration(
            seconds: 2,
          ),
          () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LoginScreen())));
    }
  }
}
