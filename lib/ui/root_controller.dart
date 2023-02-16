import 'package:babble/models/user.dart';
import 'package:babble/ui/space/chat_space/chat_space_root.dart';
import 'package:babble/ui/space/profile_space/profile_space_root.dart';
import 'package:babble/ui/space/setting_space/setting_space_root.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootController extends GetxController {
  var pageTitle = ''.obs;
  Widget pageContent = const SizedBox(
    child: Center(
      child: Text('Welcome to Babble Land!'),
    ),
  );
  var user = const User(
    id: '1',
    fullName: 'username',
    displayName: 'displayName',
  );
  var diffUser = const User(
    id: '2',
    fullName: 'username2',
    displayName: 'displayName2',
  );
  var pages = [
    const ChatSpaceRoot(),
    const SettingSpaceRoot(),
    const SettingSpaceRoot(),
    const ProfileSpaceRoot(
      user: User(
        id: '1',
        fullName: 'username',
        displayName: 'displayName',
      ),
    ),
  ];

  void setPage(Widget page, String title) {
    pageTitle.value = title;
    pageContent = page;
  }
}
