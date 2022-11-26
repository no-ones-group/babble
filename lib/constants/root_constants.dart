import 'package:get/get.dart';

class RootConstants {
  final double _mobileSidebarWidth = 50;
  final double _webSidebarWidth = 70;

  bool get isMobileScreen => Get.size.width <= 500;

  double get sidebarWidth =>
      isMobileScreen ? _mobileSidebarWidth : _webSidebarWidth;

  double get spaceWidth => Get.size.width - sidebarWidth;
}