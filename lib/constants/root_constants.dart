import 'package:get/get.dart';

class RootConstants {

  bool get isMobileScreen => Get.size.width <= 500;

  double get sidebarWidth => 70;

  double get spaceWidth => Get.size.width - sidebarWidth;
}
