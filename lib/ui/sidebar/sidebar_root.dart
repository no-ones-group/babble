import 'package:babble/constants/root_constants.dart';
import 'package:babble/constants/sidebar_constants.dart';
import 'package:babble/ui/root_controller.dart';
import 'package:babble/ui/sidebar/sidebar_controller.dart';
import 'package:babble/ui/sidebar/sidebar_icon.dart';
import 'package:babble/ui/space/chat_space/chat_space_root.dart';
import 'package:babble/ui/space/profile_space/profile_space_root.dart';
import 'package:babble/ui/space/setting_space/setting_space_root.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';

class SidebarRoot extends StatelessWidget {
  final SidebarController _sidebarController = Get.find<SidebarController>();
  final RootController _rootController = Get.find<RootController>();
  SidebarRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      child: Container(
        padding: const EdgeInsets.all(5),
        width: RootConstants().sidebarWidth,
        color: SidebarConstants().sidebarColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SidebarIcon(
                  id: 0,
                  icon: Iconsax.message,
                  notifIcon: Iconsax.message_notif,
                  onTap: () {
                    _sidebarController.selectedSidebarItemId.value = 0;
                    _rootController.setPage(const ChatSpaceRoot(), 'Chats');
                  },
                  hasNotification: _sidebarController.chatHasNotification.value,
                ),
                SidebarIcon(
                  id: 1,
                  icon: Iconsax.profile_2user,
                  onTap: () {
                    _sidebarController.selectedSidebarItemId.value = 1;
                    _rootController.setPage(const ChatSpaceRoot(), 'Users');
                  },
                ),
              ],
            ),
            Column(
              children: [
                SidebarIcon(
                  id: 2,
                  icon: Iconsax.setting,
                  onTap: () {
                    _sidebarController.selectedSidebarItemId.value = 2;
                    _rootController.setPage(
                        const SettingSpaceRoot(), 'Settings');
                  },
                ),
                SidebarIcon(
                  id: 3,
                  icon: Iconsax.user_square,
                  onTap: () {
                    _sidebarController.selectedSidebarItemId.value = 3;
                    _rootController.setPage(
                        ProfileSpaceRoot(user: _rootController.user),
                        'Profile Settings');
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
