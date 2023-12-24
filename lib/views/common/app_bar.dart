import 'package:aayats_mobile_app/views/common/reusable_text.dart';
import 'package:aayats_mobile_app/views/common/routes/app_routes_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/exports.dart';
import 'exports.dart';
/*
  PreferredSize widget gives you a space from the appbar, we can push child here.
 */

// general app bar style
class GeneralAppBar extends StatefulWidget implements PreferredSizeWidget {
  GeneralAppBar({Key? key})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<GeneralAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Row(
          children: [
            // Image.asset(
            //   'assets/images/aayats_logo.png',
            //   height: 40,
            // ),
            heading(text: 'Aayats', isGradient: true, isBold: true),
            const Spacer(),
            IconButton(
                onPressed: () {},
                icon: const GradientIcon(
                  icon: Icons.search,
                  size: 30,
                ))
          ],
        ),
      ),
    );
  }
}

// app bar for signIn and signUp pages, notice there's a skip text btn
AppBar buildAppBar(BuildContext context) {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1),
      child: Container(
        color: ColorConstants.backgroundPrimary,
        height: 1,
      ),
    ),
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 28, right: 28),
        child: textBtn(
          text: "skip",
          fontSize: 14,
          func: () => Navigator.pushNamedAndRemoveUntil(
              context, AppRoutesNames.APPLICATION, (route) => false),
        ),
      ),
    ],
    backgroundColor: ColorConstants.backgroundPrimary,
    elevation: 0,
  );
}
