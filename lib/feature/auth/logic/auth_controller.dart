import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/presentation/screens/home_page.dart';

class AuthController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var rememberMe = false.obs;
  var isPasswordVisible = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  //remember me checkbox
  void toggleRememberMe(bool? value) {
    rememberMe.value = value ?? false;
  }

  //password visibility
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  //login Button
  void login() {
    if (formKey.currentState!.validate()) {
      Get.offAll(() => const HomePage());
    }
  }
}
