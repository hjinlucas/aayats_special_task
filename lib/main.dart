import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'global.dart';
import 'views/common/exports.dart';

void main() async {
  await Global.init();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      child: MaterialApp(
        theme: AppTheme.appThemeData,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppPages.generateRouteSettings,
      ),
    );
  }
}
