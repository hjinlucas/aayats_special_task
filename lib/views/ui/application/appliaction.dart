import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/exports.dart';
import '../../../controllers/application/application_nav_notifier.dart';
import 'application_widgets.dart';

class Application extends ConsumerWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int index = ref.watch(applicationNavIndexProvider);
    return Scaffold(
      backgroundColor: ColorConstants.backgroundPrimary,
      // appBar: ArtistHomeAppBar(),
      body: appScreens(index: index),
      bottomNavigationBar: SizedBox(
        width: 393.w,
        height: 86.h,
        child: BottomNavigationBar(
          currentIndex: index,
          onTap: (value) {
            ref.read(applicationNavIndexProvider.notifier).changeIndex(value);
          },
          elevation: 0,
          items: bottomTabs,
          type: BottomNavigationBarType.fixed,
          //hide the text label below
          showUnselectedLabels: false,
          showSelectedLabels: false,
        ),
      ),
    );
  }
}
