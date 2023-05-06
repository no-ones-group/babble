import 'package:get/get.dart';

class RootConstants {
  // UI constants
  bool get isMobileScreen => Get.size.width <= 500;

  static double get headerHeight => 60;

  static double get footerHeight => 50;

  double get sidebarWidth => 70;

  double get extendedSidebarWidth => 350;

  double get spaceWidth => Get.size.width - sidebarWidth - extendedSidebarWidth;
}

mixin CollectionFields {
  String get Spaces => 'spaces';
  String get Users => 'users';
}
