import 'package:Tutora/pages/student/Review/Review.dart';
import 'package:Tutora/pages/student/query/query.dart';
import 'package:Tutora/pages/student/quiz/quizClass.dart';
import 'package:Tutora/pages/student/quiz/quizHomepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Tutora/pages/ComingSoon.dart';
import 'package:Tutora/pages/student/About%20US/aboutUs.dart';
import 'package:Tutora/pages/student/Courses/Course.dart';
import 'package:Tutora/pages/student/PDF/PdfClass.dart';
import 'package:Tutora/pages/student/coachings/creview.dart';
import 'package:Tutora/pages/student/reqtutor/ReqTutor.dart';
import 'package:Tutora/pages/student/rewords/Reword.dart';
import 'package:Tutora/pages/student/scholarship/Scholarships.dart';
import 'package:Tutora/pages/student/tasks/subjects.dart';
import 'package:Tutora/pages/student/tutors/tutorpro.dart';
import 'coachings/coachingpro.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 8.0,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(const Reword());
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Image.asset(
                            "assets/images/rewords.png",
                            width: 70,
                            height: 70,
                            color: const Color.fromARGB(255, 255, 0, 0),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text("পুরষ্কার"),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const RequestTutorInStudent()));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Image.asset(
                            "assets/images/schedule.png",
                            width: 70,
                            height: 70,
                            color: const Color.fromARGB(255, 255, 0, 0),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text("টিউটর চাই"),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(const Scholarship());
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/scholarships.png",
                          width: 70,
                          height: 70,
                          color: const Color.fromARGB(255, 255, 0, 0),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text("মাসিক বৃত্তি"),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ChochPro()));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Image.asset(
                            "assets/images/coachings.png",
                            width: 70,
                            height: 70,
                            color: const Color.fromARGB(255, 255, 0, 0),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text("কোচিং"),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(const PdfClass());
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/notes.png",
                          width: 70,
                          height: 70,
                          color: const Color.fromARGB(255, 255, 0, 0),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text("নোট খাতা")
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const quizClass()));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/dailytask.png",
                          width: 70,
                          height: 70,
                          color: const Color.fromARGB(255, 255, 0, 0),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text("Exam")
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => TutorPro()));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/tutors.png",
                          width: 70,
                          height: 70,
                          color: const Color.fromARGB(255, 255, 0, 0),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text("টিউটরেরা")
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(const Course());
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/courses.png",
                          width: 70,
                          height: 70,
                          color: const Color.fromARGB(255, 255, 0, 0),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text("কোর্সসমূহ")
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(const ComingSoon());
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/comingsoon.png",
                          width: 70,
                          height: 70,
                          color: const Color.fromARGB(255, 255, 0, 0),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text("আসিতেছে")
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(const aboutUs());
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/aboutus.png",
                          width: 70,
                          height: 70,
                          color: const Color.fromARGB(255, 255, 0, 0),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text("আমাদের জানুন")
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(QueryStudent());
                      // Get.to(MyApp());
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/247.png",
                          width: 70,
                          height: 70,
                          color: const Color.fromARGB(255, 255, 0, 0),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text("যেকোনো জিজ্ঞাসা"),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(ReviewOne());
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/settings.png",
                          width: 70,
                          height: 70,
                          // color: const Color.fromARGB(255, 255, 0, 0),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text("রিভিউ")
                      ],
                    ),
                  ),
                ),
              ]),
        ));
  }
}
