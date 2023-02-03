import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Screen/addNewRecord.dart';

import 'LoginScreen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const ProfileScreen();
                }));
              },
              icon: const Icon(Icons.person)),
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Confirmation !!!'),
                        content: Text('Are you sure to Log Out ? '),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('No'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();

                              FirebaseAuth.instance.signOut();

                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (context) {
                                return LoginScreen();
                              }));
                            },
                            child: Text('Yes'),
                          ),
                        ],
                      );
                    });
              },
              icon: const Icon(Icons.logout)),
        ],
        title: const Text('Student Record'),
      ),
      body: Column(
        children: [],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddRecord()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
