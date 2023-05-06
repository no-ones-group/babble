import 'package:babble/api/message_api.dart';
import 'package:babble/api/message_space_api.dart';
import 'package:babble/models/space.dart';
import 'package:babble/ui/extended_sidebar/extended_sidebar_controller.dart';
import 'package:babble/ui/root_controller.dart';
import 'package:get/get.dart';

class ChatSidebarController extends GetxController {
  final rootController = Get.find<RootController>();
  final extendedSidebarController = Get.find<ExtendedSidebarController>();

  @override
  void onInit() async {
    super.onInit();
  }
}
