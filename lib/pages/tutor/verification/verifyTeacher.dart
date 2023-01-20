import 'package:flutter/material.dart';
import 'package:Tutora/pages/tutor/verification/requestVerification.dart';
import 'package:get/get.dart';

class VerifyExperience extends StatefulWidget {
  const VerifyExperience({Key? key}) : super(key: key);

  @override
  State<VerifyExperience> createState() => _VerifyExperienceState();
}

class _VerifyExperienceState extends State<VerifyExperience> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/verify.png",
              color: const Color.fromARGB(255, 255, 0, 0),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "ভেরিফিকেসন আপনার যোগ্যতা জাছাই করতে আমাদের সাহাজ্য করবে এবং আপনাকে আরও টিউশন পেতে সাহাজ্য করবে",
              overflow: TextOverflow.visible,
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "আপনার বেতন বাড়িয়ে দেয়া হবে  ",
              overflow: TextOverflow.visible,
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 255, 0, 0),
                borderRadius: BorderRadius.all(Radius.circular(18)),
              ),
              child: TextButton(
                  style: TextButton.styleFrom(fixedSize: const Size(180, 50)),
                  onPressed: () {
                    {
                      Get.to(const RequestVerification());
                    }
                  },
                  child: const Text(
                    "পরের পাতা",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
