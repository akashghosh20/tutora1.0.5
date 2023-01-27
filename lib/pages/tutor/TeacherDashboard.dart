import 'package:Tutora/pages/tutor/HowItWork/howItWork1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Tutora/pages/ComingSoon.dart';
import 'package:Tutora/pages/student/About%20US/aboutUs.dart';
import 'package:Tutora/pages/tutor/nearme/TutionNearMe.dart';
import 'package:Tutora/pages/tutor/verification/verifyTeacher.dart';
import 'package:Tutora/pages/tutor/howitworks/HowItWorks1.dart';
import 'package:Tutora/pages/tutor/nearme/stdntnrme.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String dropdownValue = 'One';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Image.asset(
                            "assets/images/schedule.png",
                            width: 70,
                            height: 70,
                            color: Color.fromARGB(255, 255, 0, 0),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text("সময়সূচি"),
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
                              builder: (context) => TutionNearMe()));
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
                        const Text("টিউশন সমূহ"),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/extraearning.png",
                          width: 70,
                          height: 70,
                          color: Color.fromARGB(255, 255, 0, 0),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text("অতিরিক্ত আয়"),
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
                              builder: (context) => const VerifyExperience()));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Image.asset(
                            "assets/images/verify.png",
                            width: 70,
                            height: 70,
                            color: const Color.fromARGB(255, 255, 0, 0),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text("যোগ্যতা যাচাই"),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(howItWork1());
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/stepstofollow.png",
                          width: 70,
                          height: 70,
                          color: const Color.fromARGB(255, 255, 0, 0),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text("কাজের পদ্ধতি")
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
                        const Text("আসছে")
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
                        const Text("আসছে")
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: (() {
                      Get.to(const ComingSoon());
                    }),
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
                        const Text("আসছে")
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
                        const Text("আসছে")
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
                        const Text("আসছে")
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
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
                        const Text("আসছে")
                      ],
                    ),
                  ),
                ),
              ]),
        ));
  }
}
