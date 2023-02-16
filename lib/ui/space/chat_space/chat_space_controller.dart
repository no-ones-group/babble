import 'package:babble/models/space.dart';
import 'package:babble/ui/root_controller.dart';
import 'package:get/get.dart';

class ChatSpaceController extends GetxController {
  var selectedChat = (-1).obs;
  var _rootController = Get.find<RootController>();
}
