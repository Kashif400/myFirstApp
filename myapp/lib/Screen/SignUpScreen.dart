import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myapp/UI/roundButton.dart';
import 'package:ndialog/ndialog.dart';

import 'LoginScreen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  signUp() async {
    if (fullNameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      // show error toast

      Fluttertoast.showToast(msg: 'Please fill all fields');
      return;
    }

    if (passwordController.text.length < 6) {
      // show error toast
      Fluttertoast.showToast(
          msg: 'Weak Password, at least 6 characters are required');

      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      // show error toast
      Fluttertoast.showToast(msg: 'Passwords do not match');

      return;
    }

    // request to firebase auth

    ProgressDialog progressDialog = ProgressDialog(
      context,
      title: const Text('Signing Up'),
      message: const Text('Please wait'),
    );

    progressDialog.show();
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      if (userCredential.user != null) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return LoginScreen();
        }));
        DatabaseReference userRef =
            FirebaseDatabase.instance.ref().child('users');
        String uid = userCredential.user!.uid;
        int dt = DateTime.now().millisecondsSinceEpoch;
        await userRef.child(uid).set({
          'fullName': fullNameController.text,
          'email': emailController.text,
          'uid': uid,
          'dt': dt,
          'profileImage': ''
        });

        Fluttertoast.showToast(msg: 'SuccessFull');
        progressDialog.dismiss();
      }
    } catch (e) {
      progressDialog.dismiss();
      Fluttertoast.showToast(msg: 'Something Error' + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Sgin Up',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.blue,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 50,
            ),
            Form(
                child: Column(
              children: [
                TextFormField(
                  controller: fullNameController,
                  decoration: InputDecoration(
                      labelText: 'Full Name',
                      hintText: 'Full Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 30,
                ),
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
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'password',
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Confirm password',
                      hintText: 'Enter your Confirm password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            )),
            RoundButton(
                title: 'SignUP',
                onTap: () {
                  signUp();
                }),
          ],
        ),
      ),
    ));
  }
}
