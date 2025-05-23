import 'package:flutter/material.dart';
import 'package:gemq_flutter/pages/login_screen.dart';
import 'package:get/get.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              'GemQ',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF7965C1),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, bottom: 7.5),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                    side: BorderSide(color: Color(0xFF7965C1), width: 2.0),
                  ),
                  backgroundColor: Colors.white,
                ),
                onPressed: () {},
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF7965C1),
                  ),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 7.5),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                    side: BorderSide(color: Color(0xFF7965C1), width: 2.0),
                  ),
                  backgroundColor: Colors.white,
                ),
                onPressed: () {
                  Get.to(LoginScreen());
                },
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF7965C1),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
