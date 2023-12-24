import 'package:aayats_mobile_app/views/common/height_spacer.dart';
import 'package:aayats_mobile_app/views/common/reusable_text.dart';
import 'package:aayats_mobile_app/views/common/routes/app_routes_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/exports.dart';
import '../../../controllers/auth/signup/sign_up_controller.dart';
import '../../../controllers/auth/signup/sign_up_notifier/sign_up_notifier.dart';
import '../../common/app_text_field.dart';
import '../../common/exports.dart';
import 'widgets/auth_widgets.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});

  @override
  ConsumerState<SignUp> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUp> {
  late SignUpController _controller;

  @override
  void initState() {
    _controller = SignUpController(ref: ref);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final signUpProvider = ref.watch(signUpNotifierProvider);

    final loader = ref.watch(appLoaderProvider);
    return Container(
      color: ColorConstants.backgroundPrimary,
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppBar(context),
          backgroundColor: ColorConstants.backgroundPrimary,
          body: loader == false
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      const HeightSpacer(size: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.only(left: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              authTitle(text: "Sign Up", isGradient: true),
                              const SizedBox(height: 10),
                              mainText(
                                  text:
                                      " Create an account and enjoy all our services!"),
                            ],
                          ),
                        ),
                      ),
                      const HeightSpacer(size: 30),
                      //username
                      appTextField(
                        context: context,
                        controller: _controller.userNameController,
                        text: "User Name",
                        iconPath: ImageRes.emailIcon,
                        hintText: "Enter your username",
                        func: (value) => ref
                            .read(signUpNotifierProvider.notifier)
                            .onUserNameChange(value),
                      ),

                      //email
                      appTextField(
                        context: context,
                        controller: _controller.emailController,
                        text: "Email Address",
                        iconPath: ImageRes.emailIcon,
                        hintText: "Enter your email",
                        func: (value) => ref
                            .read(signUpNotifierProvider.notifier)
                            .onEmailChange(value),
                      ),

                      //password
                      appTextField(
                        context: context,
                        //controller: _controller.passwordController,
                        text: "Password",
                        iconPath: ImageRes.passwordIcon,
                        hintText: "Enter your password",
                        obscure: true,
                        func: (value) => ref
                            .read(signUpNotifierProvider.notifier)
                            .onPasswordChange(value),
                      ),

                      //confirm password
                      appTextField(
                        context: context,
                        //controller: _controller.rePasswordController,
                        text: "Confirm your password",
                        iconPath: ImageRes.passwordIcon,
                        hintText: "Confirm your password",
                        obscure: true,
                        func: (value) => ref
                            .read(signUpNotifierProvider.notifier)
                            .onRePasswordChange(value),
                      ),
                      const HeightSpacer(size: 20),
                      textBtn(
                          text:
                              "By creating an account you are agreeing with our term and \nand conditions."),
                      const HeightSpacer(size: 60),
                      //login button
                      appButtonRegText(
                        context: context,
                        text: "Sign Up",
                        func: () async {
                          // Update state based on the signup process
                          await _controller.handleSignUp();
                        },
                      ),
                      //google login button
                      const HeightSpacer(size: 20),
                      Wrap(
                        children: [
                          mainText(text: "Already have an account?   "),
                          textBtnHighlight(
                            text: "Sign In.",
                            func: () => Navigator.pushNamed(
                                context, AppRoutesNames.LOGIN),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(
                    backgroundColor: ColorConstants.backgroundSecondary,
                    color: ColorConstants.accentTertiary,
                  ),
                ),
        ),
      ),
    );
  }
}
