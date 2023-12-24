import 'package:aayats_mobile_app/views/common/reusable_text.dart';
import 'package:aayats_mobile_app/views/common/routes/app_routes_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

import '../../../constants/exports.dart';
import '../../../controllers/auth/login/login_controller.dart';
import '../../../controllers/auth/login/login_notifier/login_notifier.dart';
import '../../common/app_text_field.dart';
import '../../common/exports.dart';
import '../../common/height_spacer.dart';
import 'widgets/auth_widgets.dart';

class Login extends ConsumerStatefulWidget {
  const Login({super.key});

  @override
  ConsumerState<Login> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  late LoginController _controller;

  @override
  void initState() {
    super.initState();
    _controller = LoginController(
      ref,
      onSuccessNavigation: () {
        if (mounted) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              AppRoutesNames.APPLICATION, (route) => false);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final signInProvider = ref.watch(loginNotifierProvider);
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
                              authTitle(text: "Sign In", isGradient: true),
                              const SizedBox(height: 10),
                              mainText(text: " Hello, welcome to Aayats!"),
                            ],
                          ),
                        ),
                      ),
                      const HeightSpacer(size: 70),
                      //email
                      appTextField(
                        context: context,
                        controller: _controller.emailController,
                        text: "Email Address",
                        iconPath: ImageRes.emailIcon,
                        hintText: "Enter your email",
                        func: (value) => ref
                            .read(loginNotifierProvider.notifier)
                            .onEmailChange(value),
                      ),
                      appTextField(
                        //depends on different ideas
                        //if you want to keep the password user entered even something went wrong
                        //keep this line, otherwise comment it
                        controller: _controller.passwordController,
                        context: context,
                        text: "Password",
                        iconPath: ImageRes.passwordIcon,
                        hintText: "Enter your password",
                        obscure: true,
                        func: (value) => ref
                            .read(loginNotifierProvider.notifier)
                            .onPasswordChange(value),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          margin: const EdgeInsets.only(right: 24, top: 24),
                          child: textBtn(text: "Forgot password?"),
                        ),
                      ),
                      const HeightSpacer(size: 80),
                      //login button
                      appButtonRegText(
                        context: context,
                        text: "Sign In",
                        func: () async {
                          await _controller.handleSignIn();
                        },
                      ),
                      //google login button
                      thirdPartyLoginBtn(
                          context: context, imagePath: ImageRes.googleIcon),
                      const HeightSpacer(size: 20),
                      Wrap(
                        children: [
                          mainText(text: "Do not have an account?   "),
                          textBtnHighlight(
                            text: "Sign Up.",
                            context: context,
                            func: () => Navigator.pushNamed(
                                context, AppRoutesNames.SIGNUP),
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
