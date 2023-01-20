import 'package:Tutora/pages/tutor/engagedTeacher/engagedTeacher.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:Tutora/pages/CircularProgress.dart';
import 'package:Tutora/pages/student/coachings/coachingproall.dart';
import 'package:get/get.dart';
import 'package:Tutora/pages/student/tutors/tutorproall.dart';

import 'package:path/path.dart';

class TutionNearMe extends StatefulWidget {
  TutionNearMe({Key? key}) : super(key: key);
  @override
  _TutionNearMeState createState() => _TutionNearMeState();
}

class _TutionNearMeState extends State<TutionNearMe> {
  final Stream<QuerySnapshot> studentsStream =
      FirebaseFirestore.instance.collection('studentsteacherreq').snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: studentsStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {}
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgress();
          }

          final List storedocs = [];
          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map a = document.data() as Map<String, dynamic>;
            storedocs.add(a);
            a['id'] = document.id;
          }).toList();

          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      alignment: Alignment.center,
                      height: 100,
                      width: double.infinity,
                      child: const Text(
                        'টিউশন সমূহ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Raleway',
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 0, 0),
                          border: Border.all(
                              color: const Color.fromARGB(255, 192, 0, 0),
                              width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(5)))),
                  SingleChildScrollView(
                    child: Container(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          for (var i = 0; i < storedocs.length; i++) ...[
                            Container(
                              color: const Color.fromARGB(255, 255, 233, 233),
                              alignment: Alignment.center,
                              height: 230,
                              margin: const EdgeInsets.all(10.0),
                              width: double.infinity,
                              child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Image.asset(
                                        "assets/inimages/dp.png",
                                        width: double.infinity,
                                        height: double.infinity,
                                      ),
                                      flex: 1,
                                    ),
                                    Expanded(
                                      child: Container(
                                          margin: const EdgeInsets.all(10.0),
                                          height: 200,
                                          decoration: const BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 255, 233, 233)),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    "শ্রেণি    :   ",
                                                    style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 255, 0, 0),
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: 'Raleway',
                                                    ),
                                                  ),
                                                  Text(
                                                    storedocs[i]['class'],
                                                    style: TextStyle(
                                                      fontSize: 22,
                                                      color: Color.fromARGB(
                                                          255, 255, 0, 0),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: 'Raleway',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'বিষয়   :    ',
                                                    style: TextStyle(
                                                      fontSize: 17,
                                                      color: Color.fromARGB(
                                                          255, 0, 0, 0),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: 'Raleway',
                                                    ),
                                                  ),
                                                  Text(
                                                    storedocs[i]['subject'],
                                                    style: TextStyle(
                                                      fontSize: 17,
                                                      color: Color.fromARGB(
                                                          255, 0, 0, 0),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: 'Raleway',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'ঠিকানা :    ',
                                                    style: TextStyle(
                                                      fontSize: 17,
                                                      color: Color.fromARGB(
                                                          255, 0, 0, 0),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: 'Raleway',
                                                    ),
                                                  ),
                                                  Text(
                                                    storedocs[i]['city'],
                                                    style: TextStyle(
                                                      fontSize: 17,
                                                      color: Color.fromARGB(
                                                          255, 0, 0, 0),
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontFamily: 'Raleway',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'বেতন    :    ',
                                                    style: TextStyle(
                                                      fontSize: 17,
                                                      color: Color.fromARGB(
                                                          255, 0, 0, 0),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: 'Raleway',
                                                    ),
                                                  ),
                                                  Text(
                                                    storedocs[i]['salary'],
                                                    style: TextStyle(
                                                      fontSize: 17,
                                                      color: Color.fromARGB(
                                                          255, 0, 0, 0),
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontFamily: 'Raleway',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'দিন    :   ',
                                                    style: TextStyle(
                                                      fontSize: 17,
                                                      color: Color.fromARGB(
                                                          255, 0, 0, 0),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: 'Raleway',
                                                    ),
                                                  ),
                                                  Text(
                                                    storedocs[i]['days'],
                                                    style: TextStyle(
                                                      fontSize: 17,
                                                      color: Color.fromARGB(
                                                          255, 0, 0, 0),
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontFamily: 'Raleway',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'টিউশন  আইডি:   ',
                                                    style: TextStyle(
                                                      fontSize: 17,
                                                      color: Color.fromARGB(
                                                          255, 0, 0, 0),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: 'Raleway',
                                                    ),
                                                  ),
                                                  Text(
                                                    "1",
                                                    style: TextStyle(
                                                      fontSize: 17,
                                                      color: Color.fromARGB(
                                                          255, 0, 0, 0),
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontFamily: 'Raleway',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 7,
                                              ),
                                              Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Container(
                                                        decoration:
                                                            new BoxDecoration(
                                                          color: Color.fromARGB(
                                                              255, 255, 0, 0),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          15)),
                                                        ),
                                                        child: TextButton(
                                                            style: TextButton
                                                                .styleFrom(
                                                                    fixedSize:
                                                                        const Size(
                                                                            100,
                                                                            15)),
                                                            onPressed: () {
                                                              {}
                                                            },
                                                            child: Text(
                                                              storedocs[i]
                                                                  ['isbooked'],
                                                              style: TextStyle(
                                                                fontSize: 15,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            )),
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Container(
                                                        decoration:
                                                            new BoxDecoration(
                                                          color: Color.fromARGB(
                                                              255, 255, 0, 0),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          15)),
                                                        ),
                                                        child: TextButton(
                                                            style: TextButton
                                                                .styleFrom(
                                                                    fixedSize:
                                                                        const Size(
                                                                            100,
                                                                            15)),
                                                            onPressed: () {
                                                              {
                                                                Get.to(
                                                                    EnagedTeacher());
                                                              }
                                                            },
                                                            child: Text(
                                                              "বুক করুন",
                                                              style: TextStyle(
                                                                fontSize: 15,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            )),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )),
                                      flex: 2,
                                    ),
                                  ]),
                            ),
                          ]
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
