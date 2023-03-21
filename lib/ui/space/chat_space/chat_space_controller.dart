import 'dart:developer';

import 'package:babble/api/message_space_api.dart';
import 'package:babble/api/user_api.dart';
import 'package:babble/models/space.dart';
import 'package:babble/models/user.dart';
import 'package:babble/ui/root_controller.dart';
import 'package:get/get.dart';

class ChatSpaceController extends GetxController {
  var selectedChat = (-1).obs;
  var rootController = Get.find<RootController>();
  late User user;
  late List<Space> spaces;

  @override
  void onInit() async {
    user = await UserAPI().getUser(rootController.loggedInUserPhoneNumber);
    for (var spaces in user.spaces) {
      log(spaces.uuid);
    }
    spaces = await MessageSpaceAPI().getSpaces(user);
    super.onInit();
  }
}
