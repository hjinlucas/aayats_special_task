import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../constants/exports.dart';
import '../../../global.dart';
import '../../../models/request/auth/login_model.dart';
import '../../../services/helpers/auth_helper.dart';
import '../../../views/common/exports.dart';
import '../../../views/common/routes/app_routes_names.dart';
import '../../../views/common/toast_info.dart';
import 'login_notifier/login_notifier.dart';

class LoginController {
  WidgetRef ref;
  Function()?
      onSuccessNavigation; // Optional named parameter for navigation callback

  LoginController(this.ref, {this.onSuccessNavigation});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final AuthHelper _authHelper = AuthHelper();

  Future<void> handleSignIn() async {
    var state = ref.read(loginNotifierProvider);

    String email = state.email;
    String password = state.password;

    emailController.text = email;
    passwordController.text = password;

    // check if user fill all the blanks
    if (email.isEmpty || password.isEmpty) {
      toastInfo("Please fill all the blanks");
      return;
    }

    // show app loader
    ref.read(appLoaderProvider.notifier).setLoaderValue(true);

    LoginModel loginData =
        LoginModel(email: state.email, password: state.password);
    var responseData = await _authHelper.login(loginData);

    if (responseData != null) {
      // Storing the token
      await Global.storageService.setString(
          Constants.STOGRAGE_USER_TOKEN_KEY, responseData['accessToken']);

      // Constructing user profile JSON from response
      var userProfile = json.encode({
        'username': responseData['username'],
        'email': responseData['email'],
        'location': responseData['location'],
        'isCertified': responseData['isCertified'],
        'isAgent': responseData['isAgent'],
        // Add other fields as needed
      });

      /*
        Accessing User Profile Data:
        1. Retrieve the JSON string from local storage.
        2. Decode it back into a Dart object.  

        String userProfileJson = await Global.storageService.getString(Constants.STORAGE_USER_PROFILE_KEY);
        var userProfile = json.decode(userProfileJson);
        bool isCertified = userProfile['isCertified'];
        // ... and so on for other fields
        */

      // Storing the entire user profile
      await Global.storageService
          .setString(Constants.STORAGE_USER_PROFILE_KEY, userProfile);

      onSuccessNavigation?.call();
    } else {
      toastInfo("Login error");
    }

    ref.read(appLoaderProvider.notifier).setLoaderValue(false);
  }

  // Logout functionality
  Future<void> handleLogout() async {
    // Clear user token and profile from storage
    await Global.storageService
        .setString(Constants.STOGRAGE_USER_TOKEN_KEY, '');
    await Global.storageService
        .setString(Constants.STORAGE_USER_PROFILE_KEY, '');

    // Optionally, navigate to the login screen or another screen
    Navigator.of(ref.context).pushReplacementNamed(AppRoutesNames.LOGIN);

    onSuccessNavigation?.call();
  }
}
