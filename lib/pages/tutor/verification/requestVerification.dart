import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Tutora/pages/tutor/verification/verify.dart';

class RequestVerification extends StatefulWidget {
  const RequestVerification({Key? key}) : super(key: key);

  @override
  State<RequestVerification> createState() => _RequestVerificationState();
}

class _RequestVerificationState extends State<RequestVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/verify.png",
                color: const Color.fromARGB(255, 255, 0, 0),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "আপনার প্রথমে ১৫০০ টাকা দিয়ে ভেরিফিকেসন রিকুয়েস্ট করতে হবে",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "নিচের বাটনে ক্লিক করে  রিকুয়েস্ট পেজে জান ",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 55.0),
                child: GestureDetector(
                  onTap: () {
                    Get.to(const Verify());
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 2555, 0, 0),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: const Text(
                        'রিকুয়েস্ট ভেরিফিকেসন',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
