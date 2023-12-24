import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constants/exports.dart';
import '../../common/custom_image.dart';
import '../chat/chat_list.dart';
import '../feed/feed.dart';
import '../homepage/artist_home.dart';
import '../search/search.dart';
import '../user/user.dart';

// bottom nav bar
var bottomTabs = <BottomNavigationBarItem>[
  // home
  BottomNavigationBarItem(
      icon: _bottomContainer(imagePath: ImageRes.homeIcon),
      activeIcon: _bottomContainer(
          color: ColorConstants.brandPrimary, imagePath: ImageRes.homeIcon),
      label: "home"),
  // bsm
  BottomNavigationBarItem(
      icon: _bottomContainer(imagePath: ImageRes.bsmIcon),
      activeIcon: _bottomContainer(
          color: ColorConstants.brandPrimary, imagePath: ImageRes.bsmIcon),
      label: "bsm"),
  // search
  BottomNavigationBarItem(
      icon: _bottomContainer(imagePath: ImageRes.searchIcon),
      activeIcon: _bottomContainer(
          color: ColorConstants.brandPrimary, imagePath: ImageRes.searchIcon),
      label: "search"),
  // msg
  BottomNavigationBarItem(
      icon: _bottomContainer(imagePath: ImageRes.messageIcon),
      activeIcon: _bottomContainer(
          color: ColorConstants.brandPrimary, imagePath: ImageRes.messageIcon),
      label: "msg"),
  // user
  BottomNavigationBarItem(
      icon: _bottomContainer(imagePath: ImageRes.userIcon),
      activeIcon: _bottomContainer(
          color: ColorConstants.brandPrimary, imagePath: ImageRes.userIcon),
      label: "user"),
];

// icon container
Widget _bottomContainer(
    {double width = 20,
    double height = 20,
    required String imagePath,
    Color color = ColorConstants.textSecondary}) {
  return SizedBox(
    width: width.w,
    height: height.w,
    child: appImageWithColor(imagePath: imagePath, color: color),
  );
}

Widget appScreens({int index = 0}) {
  List<Widget> screens = [
    ArtistHome(),
    const Feed(),
    const Search(),
    ChatList(),
    const User(),
  ];
  return screens[index];
}
