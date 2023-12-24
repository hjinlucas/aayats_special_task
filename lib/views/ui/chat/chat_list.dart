import 'package:aayats_mobile_app/views/common/reusable_text.dart';
import 'package:flutter/material.dart';

import '../../../constants/exports.dart';
import '../../common/exports.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.backgroundPrimary,
      appBar: GeneralAppBar(),
      body: Center(
        child: heading(text: "This is ChatList Screen", isGradient: true),
      ),
    );
  }
}
