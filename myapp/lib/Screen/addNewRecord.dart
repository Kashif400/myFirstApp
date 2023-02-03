import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myapp/UI/roundButton.dart';

class AddRecord extends StatefulWidget {
  const AddRecord({super.key});

  @override
  State<AddRecord> createState() => _AddRecordState();
}

class _AddRecordState extends State<AddRecord> {
  TextEditingController fatherName = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController department = TextEditingController();
  TextEditingController semester = TextEditingController();
  User? currentUser = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Record'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                'Add Student Record',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.blue,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  var _imagepicker = ImagePicker();
                },
                child: const CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person_2_outlined,
                  ),
                  radius: 50,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Form(
                  child: Column(
                children: [
                  TextFormField(
                    controller: userName,
                    decoration: InputDecoration(
                        labelText: 'Name',
                        hintText: 'Enter your Name',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: fatherName,
                    decoration: InputDecoration(
                        labelText: 'Father Name',
                        hintText: 'Enter your FatherName',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: department,
                    decoration: InputDecoration(
                        labelText: 'Department',
                        hintText: 'Enter your Department',
                        helperText: 'Bs computer Science etc..',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: semester,
                    decoration: InputDecoration(
                        labelText: 'Semester',
                        hintText: 'Enter your Semester',
                        helperText: 'for I, II etc..',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              )),
              RoundButton(title: 'Save', onTap: () {}),
            ]),
          ),
        ));
  }
}
