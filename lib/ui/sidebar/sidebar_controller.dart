import 'package:get/get.dart';

class SidebarController extends GetxController {
  var selectedSidebarItemId = 0.obs;
  var hoveredId = (-1).obs;
  var chatHasNotification = false.obs;
}
