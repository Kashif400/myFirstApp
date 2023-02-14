import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myapp/Screen/home.dart';
import 'package:myapp/UI/roundButton.dart';
import 'package:ndialog/ndialog.dart';

class AddRecord extends StatefulWidget {
  const AddRecord({super.key});

  @override
  State<AddRecord> createState() => _AddRecordState();
}

class _AddRecordState extends State<AddRecord> {
  TextEditingController fatherName = TextEditingController();
  TextEditingController studentName = TextEditingController();
  TextEditingController department = TextEditingController();
  TextEditingController semester = TextEditingController();
  User? currentUser = FirebaseAuth.instance.currentUser;
  FirebaseStorage fs = FirebaseStorage.instance;
  List<String> imagUrl = [];
  DatabaseReference studentRef =
      FirebaseDatabase.instance.ref().child('Student');
  late ProgressDialog progressDialog;

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
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person_2_outlined,
                  ),
                  radius: 50,
                ),
                onTap: () async {},
              ),
              const SizedBox(
                height: 30,
              ),
              Form(
                  child: Column(
                children: [
                  TextFormField(
                    controller: studentName,
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
              RoundButton(
                  title: 'Save',
                  onTap: () async {
                    progressDialog = ProgressDialog(
                      context,
                      title: const Text('Save Record'),
                      message: const Text('Please wait'),
                    );
                    String id =
                        DateTime.now().millisecondsSinceEpoch.toString();

                    try {
                      progressDialog.show();
                      await studentRef.child(id).set({
                        'name': studentName.text,
                        'fatherName': fatherName.text,
                        'department': department.text,
                        'semester': semester.text,
                      });
                      progressDialog.dismiss();
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) {
                          return HomeScreen();
                        },
                      ));
                    } catch (e) {
                      progressDialog.dismiss();
                      Fluttertoast.showToast(msg: 'Error' + e.toString());
                    }
                  }),
            ]),
          ),
        ));

    //
  }
}
