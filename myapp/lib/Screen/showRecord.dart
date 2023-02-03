import 'package:flutter/material.dart';

class ShowRecord extends StatefulWidget {
  const ShowRecord({super.key});

  @override
  State<ShowRecord> createState() => _ShowRecordState();
}

class _ShowRecordState extends State<ShowRecord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Student Record Show')),
      body: Container(),
    );
  }
}
