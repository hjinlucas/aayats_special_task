import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../../../models/request/auth/signup_model.dart';
import '../../../services/config.dart';
import '../../../views/common/exports.dart';
import '../../../views/common/toast_info.dart';
import 'sign_up_notifier/sign_up_notifier.dart';
import 'sign_up_notifier/sign_up_state.dart';

class SignUpController {
  late WidgetRef ref;

  SignUpController({required this.ref});

  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();

  Future<void> handleSignUp() async {
    var state = ref.read(signUpNotifierProvider);

    // Validate the input fields
    if (!_validateInput(state)) {
      return; // Stay on the page if validation fails
    }

    // Construct the sign-up model
    SignupModel signupData = SignupModel(
      username: state.userName,
      email: state.email,
      password: state.password,
    );

    // Send the sign-up request
    await _sendSignUpRequest(signupData);
  }

  bool _validateInput(SignUpState state) {
    if (state.userName.isEmpty ||
        state.email.isEmpty ||
        state.password.isEmpty ||
        state.rePassword.isEmpty) {
      toastInfo("Please fill all the blanks");
      return false;
    }
    if (state.userName.length < 3) {
      toastInfo(
          "Your username is too short, should be more than 3 characters.");
      return false;
    }
    if (state.password != state.rePassword) {
      toastInfo("Your passwords did not match");
      return false;
    }
    return true;
  }

  Future<void> _sendSignUpRequest(SignupModel signupData) async {
    // Show app loader before starting the network request
    ref.read(appLoaderProvider.notifier).setLoaderValue(true);

    final url = Uri.parse('${Config.apiUrl}/api/register');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: signupModelToJson(signupData),
      );

      if (response.statusCode == 201) {
        toastInfo(
            "Registration successful. Please check your email to verify your account.");
        Navigator.of(ref.context)
            .pop(); // Navigate back after successful registration
      } else {
        toastInfo("Registration failed. Please try again.");
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      toastInfo("An error occurred. Please try again.");
    } finally {
      ref.read(appLoaderProvider.notifier).setLoaderValue(false);
    }
  }
}
