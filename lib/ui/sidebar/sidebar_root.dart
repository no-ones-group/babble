import 'package:babble/constants/root_constants.dart';
import 'package:babble/constants/sidebar_constants.dart';
import 'package:babble/ui/root_controller.dart';
import 'package:babble/ui/sidebar/sidebar_controller.dart';
import 'package:babble/ui/sidebar/sidebar_icon.dart';
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
      elevation: 5,
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
                    _rootController.pageIndex.value = 0;
                  },
                  hasNotification: _sidebarController.chatHasNotification.value,
                ),
                SidebarIcon(
                  id: 1,
                  icon: Iconsax.profile_2user,
                  onTap: () {
                    _rootController.pageIndex.value = 1;
                    _sidebarController.chatHasNotification.value =
                        !_sidebarController.chatHasNotification.value;
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
                    _rootController.pageIndex.value = 2;
                  },
                ),
                SidebarIcon(
                  id: 3,
                  icon: Iconsax.user_square,
                  onTap: () {
                    _rootController.pageIndex.value = 3;
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
