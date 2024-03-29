import 'dart:developer';

import 'package:babble/api/message_space_api.dart';
import 'package:babble/api/user_api.dart';
import 'package:babble/models/space.dart';
import 'package:babble/models/user.dart';
import 'package:babble/ui/root_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

class UserSidebarController extends GetxController {
  var selectedChat = (-1).obs;
  var rootController = Get.find<RootController>();
  var data = FirebaseFirestore.instance.collection('users').snapshots();
  late User user;
  late List<Space> spaces;

  @override
  void onInit() async {
    user = await UserAPI().getUser(rootController.loggedInUserPhoneNumber);
    super.onInit();
  }
}
