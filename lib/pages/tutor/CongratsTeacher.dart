import 'package:flutter/material.dart';
import 'package:Tutora/pages/tutor/TeacherMain.dart';

class CongratsTeacher extends StatefulWidget {
  CongratsTeacher({Key? key}) : super(key: key);

  @override
  State<CongratsTeacher> createState() => _CongratsTeacherState();
}

class _CongratsTeacherState extends State<CongratsTeacher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                          child:
                              Image.asset("assets/images/studywithlaptop.gif")),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Congratulations Teacher",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "আমরা আপনার ডাটা স্টোর করেছি",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "আশা করি খুব শিগ্রই আপনি টিউশন পেয়ে যাবেন ",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                  color: Colors.red),
              child: TextButton(
                  style: TextButton.styleFrom(fixedSize: const Size(180, 50)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => TeacherMain()));
                  },
                  child: Text(
                    "ড্যাসবোর্ড",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
