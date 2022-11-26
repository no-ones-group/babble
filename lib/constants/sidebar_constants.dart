import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SidebarConstants {
  final double _mobileSidebarIconSize = 40;
  final double _webSidebarIconSize = 50;
  
  bool get isMobileScreen => Get.size.width <= 500;

  double get sidebarIconSize =>
      isMobileScreen ? _mobileSidebarIconSize : _webSidebarIconSize;

  // Colors for Sidebar and SidebarIcon
  Color get sidebarColor => const Color.fromRGBO(3, 102, 102, 1);

  Color get sidebarIconBGColor => Colors.transparent;
  Color get sidebarIconColor => const Color.fromARGB(153, 226, 180, 122);

  Color get sidebarIconEventBGColor => const Color.fromARGB(153, 226, 180, 122);
  Color get sidebarIconEventColor => const Color.fromRGBO(3, 102, 102, 1);
}
