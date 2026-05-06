import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  // Login
  final loginEmailController = TextEditingController();
  final loginPasswordController = TextEditingController();
  final rememberMe = false.obs;

  // Sign Up
  final signUpNameController = TextEditingController();
  final signUpEmailController = TextEditingController();
  final signUpPasswordController = TextEditingController();
  final signUpConfirmPasswordController = TextEditingController();
  final signUpRememberMe = false.obs;

  // Forgot Password
  final forgotEmailController = TextEditingController();

  // OTP
  final otpController = TextEditingController();

  // Reset Password
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmNewPasswordController = TextEditingController();

  @override
  void onClose() {
    loginEmailController.dispose();
    loginPasswordController.dispose();
    signUpNameController.dispose();
    signUpEmailController.dispose();
    signUpPasswordController.dispose();
    signUpConfirmPasswordController.dispose();
    forgotEmailController.dispose();
    otpController.dispose();
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
    super.onClose();
  }

  void toggleRememberMe() {
    rememberMe.value = !rememberMe.value;
  }

  void toggleSignUpRememberMe() {
    signUpRememberMe.value = !signUpRememberMe.value;
  }
}
