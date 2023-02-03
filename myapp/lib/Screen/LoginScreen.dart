import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ndialog/ndialog.dart';

import '../UI/roundButton.dart';
import 'SignUpScreen.dart';
import 'home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  login() async {
    ProgressDialog progressDialog = ProgressDialog(
      context,
      title: const Text('Signing Up'),
      message: const Text('Please wait'),
    );

    progressDialog.show();
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      if (userCredential.user != null) {
        Fluttertoast.showToast(msg: 'Login');
        progressDialog.dismiss();
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Something Error' + e.toString());
      progressDialog.dismiss();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Login',
            style: TextStyle(
                fontSize: 30, color: Colors.blue, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 50,
          ),
          Form(
              child: Column(
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                    labelText: 'password',
                    hintText: 'Enter your password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          )),
          RoundButton(
              title: 'Login',
              onTap: () {
                login();
              }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Not Registered Yet'),
              TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return SignUpScreen();
                    }));
                  },
                  child: Text('Register Now')),
            ],
          )
        ],
      ),
    ));
  }
}
