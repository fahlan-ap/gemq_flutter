import 'package:flutter/material.dart';
import 'package:gemq_flutter/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailC = TextEditingController();
  final passC = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    emailC.dispose();
    passC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100, bottom: 50),
            child: Text(
              "GemQ",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF7965C1),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, bottom: 7.5),
            child: TextField(
              controller: emailC, // ✅ Tambahkan controller
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
                hintStyle: TextStyle(color: Color.fromARGB(255, 199, 196, 196)),
                border: OutlineInputBorder(),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(
              left: 30,
              right: 30,
              top: 7.5,
              bottom: 7.5,
            ),
            child: TextField(
              controller: passC, 
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
                hintStyle: TextStyle(color: Color.fromARGB(255, 199, 196, 196)),
                border: OutlineInputBorder(),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 25, right: 30, left: 30),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                  backgroundColor: const Color(0xFF7965C1),
                ),
                onPressed: _isLoading
                    ? null
                    : () async {
                        setState(() {
                          _isLoading = true;
                        });

                        await AuthService().login(
                          emailC.text.trim(),
                          passC.text.trim(),
                        );

                        setState(() {
                          _isLoading = false;
                        });
                      },
                child: SizedBox(
                  height: 20,
                  child: Center(
                    child: _isLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                        : const Text(
                            'Sign In',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
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
