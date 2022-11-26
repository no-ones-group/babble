import 'package:babble/models/user.dart';
import 'package:babble/ui/space/chat_space/chat_space_root.dart';
import 'package:babble/ui/space/profile_space/profile_space_root.dart';
import 'package:babble/ui/space/setting_space/setting_space_root.dart';
import 'package:get/get.dart';

class RootController extends GetxController {
  var pageIndex = 0.obs;
  var pageTitles = ['Chats', 'Users', 'Settings', 'Profile'];
  var pages = [
    const ChatSpaceRoot(),
    const SettingSpaceRoot(),
    const SettingSpaceRoot(),
    const ProfileSpaceRoot(
      user: User(
        id: 1,
        username: 'username',
        firstname: 'firstname',
        lastname: 'lastname',
      ),
    ),
  ];
}
