import 'package:Tutora/pages/CircularProgress.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TutorName extends StatelessWidget {
  final String id;
  TutorName({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('teachers');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(id).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;

          // return Text(
          //     "Full Name: ${data['coaching']} ${data['subject']} ${data['class']} ${data['address']}");
          return SafeArea(
            child: Container(
                color: Color.fromARGB(255, 255, 255, 255),
                height: 1000.0,
                // alignment: Alignment.topLeft,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: Color.fromARGB(255, 253, 179, 179),
                        alignment: Alignment.center,
                        height: 150,
                        margin: const EdgeInsets.all(10.0),
                        width: double.infinity,
                        child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Image.asset(
                                  "assets/images/tutorsdp.png",
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                                flex: 1,
                              ),
                              Expanded(
                                child: Container(
                                    margin: const EdgeInsets.all(10.0),
                                    height: 150,
                                    decoration: const BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 253, 179, 179)),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Name : ',
                                              style: TextStyle(
                                                fontSize: 17,
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Raleway',
                                              ),
                                            ),
                                            Text(
                                              "${data['name']}",
                                              style: TextStyle(
                                                fontSize: 17,
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Raleway',
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Classes:  ',
                                              style: TextStyle(
                                                fontSize: 17,
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Raleway',
                                              ),
                                            ),
                                            Text(
                                              "${data['target student']}",
                                              style: TextStyle(
                                                fontSize: 17,
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                                fontWeight: FontWeight.normal,
                                                fontFamily: 'Raleway',
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Subjects:  ',
                                              style: TextStyle(
                                                fontSize: 17,
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Raleway',
                                              ),
                                            ),
                                            Text(
                                              "${data['teaching subject']}",
                                              style: TextStyle(
                                                fontSize: 17,
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                                fontWeight: FontWeight.normal,
                                                fontFamily: 'Raleway',
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Reviews:  ',
                                              style: TextStyle(
                                                fontSize: 17,
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Raleway',
                                              ),
                                            ),
                                            Text(
                                              '21  ',
                                              style: TextStyle(
                                                fontSize: 17,
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                                fontWeight: FontWeight.normal,
                                                fontFamily: 'Raleway',
                                              ),
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Color.fromARGB(
                                                  255, 253, 0, 0),
                                              size: 17.0,
                                              semanticLabel:
                                                  'Text to announce in accessibility modes',
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                flex: 2,
                              ),
                            ]),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tutora feedback',
                              style: TextStyle(
                                fontSize: 22,
                                color: Color.fromARGB(255, 255, 0, 0),
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Raleway',
                              ),
                            ),
                            Text(
                              "${data['tutorafeedback']}",
                              style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.italic,
                                fontFamily: 'Raleway',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Educational background',
                              style: TextStyle(
                                fontSize: 22,
                                color: Color.fromARGB(255, 247, 0, 0),
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Raleway',
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  'University :  ',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Raleway',
                                  ),
                                ),
                                Text(
                                  "${data['university']}",
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Raleway',
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Subject :  ',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Raleway',
                                  ),
                                ),
                                Text(
                                  "${data['study subject']}",
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Raleway',
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Study year :  ',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Raleway',
                                  ),
                                ),
                                Text(
                                  "${data['study year']}",
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Raleway',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Personal Details',
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: Color.fromARGB(255, 255, 0, 0),
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Raleway',
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Age :  ',
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Raleway',
                                    ),
                                  ),
                                  Text(
                                    "${data['age']}",
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Raleway',
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Religion :  ',
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Raleway',
                                    ),
                                  ),
                                  Text(
                                    "${data['religion']}",
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Raleway',
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Present Address :  ',
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Raleway',
                                    ),
                                  ),
                                  Text(
                                    "${data['presentadd']}",
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Raleway',
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Permanent Address :  ',
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Raleway',
                                    ),
                                  ),
                                  Text(
                                    "${data['permanentadd']}",
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Raleway',
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                      ),
                    ])),
          );

          // this bracket is the main braket
        }

        return CircularProgress();
      },
    );
  }
}
