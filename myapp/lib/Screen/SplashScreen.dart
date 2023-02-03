import 'package:flutter/material.dart';
import 'package:myapp/Screen/SplashServices.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices = SplashServices();

  @override
  void initState() {
    splashServices.isLogin(context);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 145, 180, 240),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(
            flex: 4,
            child: Center(
              child: Text(
                'Facebook',
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w900,
                    color: Color.fromARGB(255, 247, 245, 245)),
              ),
            ),
          ),
          Expanded(
            flex: 0,
            child: Text(
              'welcome',
              style: TextStyle(color: Colors.grey.shade300, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
