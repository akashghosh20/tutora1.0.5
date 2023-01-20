import 'dart:io';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:Tutora/pages/tutor/CongratsTeacher.dart';
import 'package:Tutora/pages/localdata.dart';

class AddTeacherPage extends StatefulWidget {
  AddTeacherPage({Key? key}) : super(key: key);

  @override
  _AddTeacherPage createState() => _AddTeacherPage();
}

class _AddTeacherPage extends State<AddTeacherPage> {
  final _formKey = GlobalKey<FormState>();

  var email = "";
  var userName = "";
  var name = "";
  var age = "";
  var gender = "";
  var religion = "";
  var phoneNumber = "";
  var university = "";
  var teachingAreas = "";
  var studySubject = "";
  var targetStudent = "";
  var days = "";
  var experience = "";
  var teachingCity = "";
  var askingSalary = "";
  var teachingSubject = "";
  var tutoraFeedBack = "";

  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final ageController = TextEditingController();
  final religionController = TextEditingController();
  final confirmGenderController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final universityController = TextEditingController();
  final teachingAreasController = TextEditingController();
  final studySubjectController = TextEditingController();
  final targetStudentController = TextEditingController();
  final daysController = TextEditingController();
  final askingSalaryController = TextEditingController();
  final cityTeachingController = TextEditingController();
  final experienceController = TextEditingController();
  final teachingSubjectController = TextEditingController();
  final teachingCityController = TextEditingController();
  final tutoraFeedbackController = TextEditingController();
  String? url;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    usernameController.dispose();
    nameController.dispose();
    confirmGenderController.dispose();
    religionController.dispose();
    phoneController.dispose();
    ageController.dispose();
    universityController.dispose();
    teachingAreasController.dispose();
    cityTeachingController.dispose();
    experienceController.dispose();
    askingSalaryController.dispose();
    daysController.dispose();
    cityTeachingController.dispose();
    targetStudentController.dispose();
    teachingSubjectController.dispose();
    teachingCityController.dispose();
    super.dispose();
  }

  // Adding Student
  CollectionReference pids = FirebaseFirestore.instance.collection('teachers');

  Future<void> addUser() async {
    final imgurl = await uploadImage(_image!);
    return pids
        .add({
          'email': email,
          'user name': userName,
          'name': name,
          'gender': gender,
          'religion': religion,
          'phone number': phoneNumber,
          'age': age,
          'university': university,
          'teaching city': teachingCity,
          'teaching areas': teachingAreas,
          'image url': url,
          'experience': experience,
          "study subject": studySubject,
          'asking salary': askingSalary,
          'days': days,
          "target student": targetStudent,
          'teaching subject': teachingSubject,
          'tutorafeedback': tutoraFeedBack,
        })
        .then((value) => print('User Added'))
        .catchError((error) => print('Failed to Add user: $error'));
  }

  File? _image;
  final picker = ImagePicker();
  // String? downloadUrl;

  Future imagePicker() async {
    try {
      final pick = await picker.pickImage(source: ImageSource.gallery);
      setState(() {
        if (pick != null) {
          _image = File(pick.path);
        }
      });
    } catch (e) {}
  }

  Future uploadImage(File _image) async {
    String imgId = DateTime.now().microsecondsSinceEpoch.toString();

    Reference refrence =
        FirebaseStorage.instance.ref().child('images').child('user$imgId');
    await refrence.putFile(_image);
    url = await refrence.getDownloadURL();
  }

  @override
  void initState() {
    tutoraFeedbackController.text = "Category:";
    usernameController.text = UserSharedPreference().getTeacherUserName() ?? "";
    universityController.text = UserSharedPreference().getUniversity() ?? "";
    studySubjectController.text =
        UserSharedPreference().getStudySubjectTeacher() ?? "";
    emailController.text = UserSharedPreference().getTeacherEmail() ?? "";
    nameController.text = UserSharedPreference().getTeacherName() ?? "";
    confirmGenderController.text =
        UserSharedPreference().getTeacherGender() ?? "";
    targetStudentController.text =
        UserSharedPreference().getTeacherTargetSTudents() ?? "";
    experienceController.text =
        UserSharedPreference().getTeacherExperience() ?? "";
    askingSalaryController.text =
        UserSharedPreference().getTeacherAskingSalary() ?? "";
    phoneController.text = UserSharedPreference().getTeacherPhone() ?? "";
    teachingAreasController.text =
        UserSharedPreference().getTeacherTeachingAreas() ?? "";
    cityTeachingController.text = UserSharedPreference().getTeacherCity() ?? "";

    ageController.text = UserSharedPreference().getTeacherAge() ?? "";
    daysController.text = UserSharedPreference().getTeacherTeachingDays() ?? "";
    religionController.text = UserSharedPreference().getTeacherReligion() ?? "";
    teachingSubjectController.text =
        UserSharedPreference().getTeacherTeachingSubjects() ?? "";
    teachingCityController.text =
        UserSharedPreference().getTeacherTeachingCity() ?? "";
    tutoraFeedbackController.text =
        UserSharedPreference().getTutoraFeedback() ?? "Category:";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 0, 0),
        centerTitle: true,
        title: Text("Complete Profile Page"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: ListView(
            children: [
              Column(
                children: [
                  Container(
                      height: 250,
                      width: 250,
                      child: Column(
                        children: [
                          const Text(
                            "Add Picture",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              width: 250,
                              height: 250,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 255, 0, 0))),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: _image == null
                                              ? Center(
                                                  child: Image.asset(
                                                  "assets/images/profile.png",
                                                  height: 150,
                                                  width: 150,
                                                ))
                                              : Image.file(_image!,
                                                  height: 150,
                                                  width: 150,
                                                  fit: BoxFit.contain),
                                        ),
                                      ],
                                    ),
                                    ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Color.fromARGB(
                                                        255, 255, 0, 0))),
                                        onPressed: () {
                                          imagePicker();
                                        },
                                        child: const Text("Select Image")),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
              Container(
                // this container is the value box for taking inputs
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    focusColor: Color.fromARGB(255, 255, 0, 0),
                    labelText: 'Email',
                    labelStyle: TextStyle(
                        fontSize: 20.0, color: Color.fromARGB(255, 0, 0, 0)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 0, 0),
                      width: 1,
                    )),
                    errorStyle: TextStyle(
                        color: Color.fromARGB(255, 255, 0, 0), fontSize: 15),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 255, 0, 0),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 255, 0, 0),
                      ),
                    ),
                  ),
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Email';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    focusColor: Color.fromARGB(255, 255, 0, 0),
                    labelText: 'User Name',
                    labelStyle: TextStyle(
                        fontSize: 20.0, color: Color.fromARGB(255, 0, 0, 0)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 0, 0),
                      width: 1,
                    )),
                    errorStyle: TextStyle(
                        color: Color.fromARGB(255, 255, 0, 0), fontSize: 15),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 255, 0, 0),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 255, 0, 0),
                      ),
                    ),
                  ),
                  controller: usernameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter User Name';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    focusColor: Color.fromARGB(255, 255, 0, 0),
                    labelText: 'Name',
                    labelStyle: TextStyle(
                        fontSize: 20.0, color: Color.fromARGB(255, 0, 0, 0)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 0, 0),
                      width: 1,
                    )),
                    errorStyle: TextStyle(
                        color: Color.fromARGB(255, 255, 0, 0), fontSize: 15),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 255, 0, 0),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 255, 0, 0),
                      ),
                    ),
                  ),
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Name';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    focusColor: Color.fromARGB(255, 255, 0, 0),
                    labelText: 'Gender',
                    labelStyle: TextStyle(
                        fontSize: 20.0, color: Color.fromARGB(255, 0, 0, 0)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 0, 0),
                      width: 1,
                    )),
                    errorStyle: TextStyle(
                        color: Color.fromARGB(255, 255, 0, 0), fontSize: 15),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 255, 0, 0),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 255, 0, 0),
                      ),
                    ),
                  ),
                  controller: confirmGenderController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Gender';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    focusColor: Color.fromARGB(255, 255, 0, 0),
                    labelText: 'Religion',
                    labelStyle: TextStyle(
                        fontSize: 20.0, color: Color.fromARGB(255, 0, 0, 0)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 0, 0),
                      width: 1,
                    )),
                    errorStyle: TextStyle(
                        color: Color.fromARGB(255, 255, 0, 0), fontSize: 15),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 255, 0, 0),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 255, 0, 0),
                      ),
                    ),
                  ),
                  controller: religionController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Religion';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    focusColor: Color.fromARGB(255, 255, 0, 0),
                    labelText: 'Phone Number',
                    labelStyle: TextStyle(
                        fontSize: 20.0, color: Color.fromARGB(255, 0, 0, 0)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 0, 0),
                      width: 1,
                    )),
                    errorStyle: TextStyle(
                        color: Color.fromARGB(255, 255, 0, 0), fontSize: 15),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 255, 0, 0),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 255, 0, 0),
                      ),
                    ),
                  ),
                  controller: phoneController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Your Phone Number';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    focusColor: Color.fromARGB(255, 255, 0, 0),
                    labelText: 'Age: ',
                    labelStyle: TextStyle(
                        fontSize: 20.0, color: Color.fromARGB(255, 0, 0, 0)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 0, 0),
                      width: 1,
                    )),
                    errorStyle: TextStyle(
                        color: Color.fromARGB(255, 255, 0, 0), fontSize: 15),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 255, 0, 0),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 255, 0, 0),
                      ),
                    ),
                  ),
                  controller: ageController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Your Age';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    focusColor: Color.fromARGB(255, 255, 0, 0),
                    labelText: 'University: ',
                    labelStyle: TextStyle(
                        fontSize: 20.0, color: Color.fromARGB(255, 0, 0, 0)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 0, 0),
                      width: 1,
                    )),
                    errorStyle: TextStyle(
                        color: Color.fromARGB(255, 255, 0, 0), fontSize: 15),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 255, 0, 0),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 255, 0, 0),
                      ),
                    ),
                  ),
                  controller: universityController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Your University';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    focusColor: Color.fromARGB(255, 255, 0, 0),
                    labelText: 'Study Subject ',
                    labelStyle: TextStyle(
                        fontSize: 20.0, color: Color.fromARGB(255, 0, 0, 0)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 0, 0),
                      width: 1,
                    )),
                    errorStyle: TextStyle(
                        color: Color.fromARGB(255, 255, 0, 0), fontSize: 15),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 255, 0, 0),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 255, 0, 0),
                      ),
                    ),
                  ),
                  controller: studySubjectController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Your Subject';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    focusColor: Color.fromARGB(255, 255, 0, 0),
                    labelText: 'Teaching Subjects : ',
                    labelStyle: TextStyle(
                        fontSize: 20.0, color: Color.fromARGB(255, 0, 0, 0)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 0, 0),
                      width: 1,
                    )),
                    errorStyle: TextStyle(
                        color: Color.fromARGB(255, 255, 0, 0), fontSize: 15),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 255, 0, 0),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 255, 0, 0),
                      ),
                    ),
                  ),
                  controller: teachingSubjectController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Your Teaching SUbjects';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    focusColor: Color.fromARGB(255, 255, 0, 0),
                    labelText: 'Teaching City : ',
                    labelStyle: TextStyle(
                        fontSize: 20.0, color: Color.fromARGB(255, 0, 0, 0)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 0, 0),
                      width: 1,
                    )),
                    errorStyle: TextStyle(
                        color: Color.fromARGB(255, 255, 0, 0), fontSize: 15),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 255, 0, 0),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 255, 0, 0),
                      ),
                    ),
                  ),
                  controller: teachingCityController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Teaching City';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    focusColor: Color.fromARGB(255, 255, 0, 0),
                    labelText: 'Teaching Areas: ',
                    labelStyle: TextStyle(
                        fontSize: 20.0, color: Color.fromARGB(255, 0, 0, 0)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 0, 0),
                      width: 1,
                    )),
                    errorStyle: TextStyle(
                        color: Color.fromARGB(255, 255, 0, 0), fontSize: 15),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 255, 0, 0),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 255, 0, 0),
                      ),
                    ),
                  ),
                  controller: teachingAreasController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Your Teaching Areas';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    focusColor: Color.fromARGB(255, 255, 0, 0),
                    labelText: 'Experience',
                    labelStyle: TextStyle(
                        fontSize: 20.0, color: Color.fromARGB(255, 0, 0, 0)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 0, 0),
                      width: 1,
                    )),
                    errorStyle: TextStyle(
                        color: Color.fromARGB(255, 255, 0, 0), fontSize: 15),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 255, 0, 0),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 255, 0, 0),
                      ),
                    ),
                  ),
                  controller: experienceController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Your Experince(years)';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    focusColor: Color.fromARGB(255, 255, 0, 0),
                    labelText: 'Target Students: ',
                    labelStyle: TextStyle(
                        fontSize: 20.0, color: Color.fromARGB(255, 0, 0, 0)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 0, 0),
                      width: 1,
                    )),
                    errorStyle: TextStyle(
                        color: Color.fromARGB(255, 255, 0, 0), fontSize: 15),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 255, 0, 0),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 255, 0, 0),
                      ),
                    ),
                  ),
                  controller: targetStudentController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Your Target Students';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    focusColor: Color.fromARGB(255, 255, 0, 0),
                    labelText: 'Teaching Days: ',
                    labelStyle: TextStyle(
                        fontSize: 20.0, color: Color.fromARGB(255, 0, 0, 0)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 0, 0),
                      width: 1,
                    )),
                    errorStyle: TextStyle(
                        color: Color.fromARGB(255, 255, 0, 0), fontSize: 15),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 255, 0, 0),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 255, 0, 0),
                      ),
                    ),
                  ),
                  controller: daysController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Your Teaching Days';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    focusColor: Color.fromARGB(255, 255, 0, 0),
                    labelText: 'Asking Salary: ',
                    labelStyle: TextStyle(
                        fontSize: 20.0, color: Color.fromARGB(255, 0, 0, 0)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 0, 0),
                      width: 1,
                    )),
                    errorStyle: TextStyle(
                        color: Color.fromARGB(255, 255, 0, 0), fontSize: 15),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 255, 0, 0),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 255, 0, 0),
                      ),
                    ),
                  ),
                  controller: askingSalaryController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Your Asking Salary';
                    }
                    return null;
                  },
                ),
              ),
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    "Don't fill the Tutora FeedBack field",
                    textStyle: const TextStyle(
                      color: Color.fromARGB(255, 255, 0, 0),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    speed: const Duration(milliseconds: 200),
                  ),
                ],
                totalRepeatCount: 5,
                pause: const Duration(milliseconds: 1000),
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    focusColor: Color.fromARGB(255, 255, 0, 0),
                    labelText: 'Tutora FeedBack: ',
                    labelStyle: TextStyle(
                        fontSize: 20.0, color: Color.fromARGB(255, 0, 0, 0)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 0, 0),
                      width: 1,
                    )),
                    errorStyle: TextStyle(
                        color: Color.fromARGB(255, 255, 0, 0), fontSize: 15),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 255, 0, 0),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 255, 0, 0),
                      ),
                    ),
                  ),
                  controller: tutoraFeedbackController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Your Asking Salary';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                height: 60,
                decoration: BoxDecoration(
                    color: Color.fromARGB(
                      255,
                      255,
                      0,
                      0,
                    ),
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 255, 0, 0))),
                      onPressed: () {
                        // Validate returns true if the form is valid, otherwise false.
                        if (_formKey.currentState!.validate()) {
                          setState(() async {
                            email = emailController.text;
                            userName = usernameController.text;
                            name = nameController.text;
                            gender = confirmGenderController.text;
                            religion = religionController.text;
                            phoneNumber = phoneController.text;
                            age = ageController.text;
                            university = universityController.text;
                            teachingCity = cityTeachingController.text;
                            experience = experienceController.text;
                            days = daysController.text;
                            studySubject = studySubjectController.text;
                            teachingSubject = teachingSubjectController.text;
                            askingSalary = askingSalaryController.text;
                            targetStudent = targetStudentController.text;
                            teachingAreas = teachingAreasController.text;
                            teachingCity = teachingCityController.text;

                            addUser();

                            await UserSharedPreference()
                                .setTeacherUserName(usernameController.text);
                            await UserSharedPreference()
                                .setUniversity(universityController.text);
                            await UserSharedPreference().setStudySubjectTeacher(
                                studySubjectController.text);
                            await UserSharedPreference()
                                .setTeacherAge(ageController.text);
                            await UserSharedPreference()
                                .setTeacherEmail(emailController.text);
                            await UserSharedPreference().setTeacherExperience(
                                experienceController.text);
                            await UserSharedPreference().setStudySubjectTeacher(
                                studySubjectController.text);
                            await UserSharedPreference()
                                .setTeacherGender(confirmGenderController.text);
                            await UserSharedPreference()
                                .setTeacherPhone(phoneController.text);
                            await UserSharedPreference()
                                .setTeacherReligion(religionController.text);
                            await UserSharedPreference()
                                .setTeacherTargetStudents(
                                    targetStudentController.text);
                            await UserSharedPreference()
                                .setTeacherTeachingDays(daysController.text);
                            await UserSharedPreference()
                                .setTeacherTeachingSubjects(
                                    teachingSubjectController.text);
                            await UserSharedPreference().setTeacherAskingSalary(
                                askingSalaryController.text);
                            await UserSharedPreference()
                                .setTeacherTeachingAreas(
                                    teachingAreasController.text);
                            await UserSharedPreference()
                                .setTeacherName(nameController.text);
                            await UserSharedPreference().setTeacherTeachingCity(
                                teachingCityController.text);
                            await UserSharedPreference().setGetTutoraFeedback(
                                tutoraFeedbackController.text);

                            Get.to(CongratsTeacher());
                          });
                        }
                      },
                      child: Text(
                        'Complete / Update',
                        style: TextStyle(fontSize: 22.0, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
