import 'package:aayats_mobile_app/views/ui/application/appliaction.dart';
import 'package:aayats_mobile_app/views/ui/auth/signup.dart';
import 'package:aayats_mobile_app/views/ui/chat/chat_list.dart';
import 'package:aayats_mobile_app/views/ui/homepage/artist_home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../global.dart';
import '../../ui/auth/login.dart';
import 'app_routes_names.dart';

class AppPages {
  static List<RouteEntity> routes() {
    return [
      RouteEntity(path: AppRoutesNames.APPLICATION, page: const Application()),
      RouteEntity(path: AppRoutesNames.LOGIN, page: const Login()),
      RouteEntity(path: AppRoutesNames.SIGNUP, page: const SignUp()),
      RouteEntity(path: AppRoutesNames.ARTIST_HOME, page: ArtistHome()),
      RouteEntity(path: AppRoutesNames.CHAT_LIST, page: ChatList()),
    ];
  }

  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (kDebugMode) {
      print("clicked route is ${settings.name}");
    }

    var result = routes().where((element) => element.path == settings.name);

    if (result.isNotEmpty) {
      // here is to check if we use this app for the first time or not
      bool deviceFirstTime = Global.storageService.getDeviceFirstOpen();

      if (result.first.path == AppRoutesNames.WELCOME && deviceFirstTime) {
        bool isLoggedIn = Global.storageService.isLoggedIn();

        // if is logged in, nav to home, otherwise nav to sign in
        if (isLoggedIn) {
          return MaterialPageRoute(
            builder: (_) => Application(),
            settings: settings,
          );
        } else {
          return MaterialPageRoute(
            builder: (_) => Login(),
            settings: settings,
          );
        }
      } else {
        return MaterialPageRoute(
          builder: (_) => result.first.page,
          settings: settings,
        );
      }
    }
    return MaterialPageRoute(
      builder: (_) => Login(),
      settings: settings,
    );
  }
}

class RouteEntity {
  String path;
  Widget page;
  RouteEntity({required this.path, required this.page});
}
