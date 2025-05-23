import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:gemq_flutter/pages/dashboard.dart';

class AuthService extends GetxService {
  final supabase = Supabase.instance.client;

  Future<void> login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar(
        "Input Kosong",
        "Email dan password tidak boleh kosong.",
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
      return;
    }

    try {
      final AuthResponse res = await supabase.auth.signInWithPassword(
        email: email.trim(),
        password: password.trim(),
      );

      final user = res.user;
      if (user != null) {
        print("Login berhasil sebagai: ${user.email}");
        Get.off(() => const Dashboard());
      }
    } on AuthException catch (e) {
      Get.snackbar(
        "Login Gagal",
        e.message,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        "Error",
        "Terjadi kesalahan saat login",
        backgroundColor: Colors.orange,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
