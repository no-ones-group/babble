import 'package:babble/constants/root_constants.dart';
import 'package:babble/constants/sidebar_constants.dart';
import 'package:babble/ui/root_controller.dart';
import 'package:babble/ui/sidebar/sidebar_controller.dart';
import 'package:babble/ui/sidebar/sidebar_icon.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';

class SidebarRoot extends StatelessWidget {
  final SidebarController _sidebarController = Get.find<SidebarController>();
  final RootController _rootController = Get.find<RootController>();
  SidebarRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      width: RootConstants().sidebarWidth,
      color: SidebarConstants().sidebarColor,
      child: Column(
        children: [
          SidebarIcon(
            id: 1,
            icon: Iconsax.message_favorite,
            onTap: () {
              _sidebarController.selectedId.value = 1;
              _rootController.pageIndex.value = 1;
            },
          ),
          SidebarIcon(
            id: 2,
            heroIcon: HeroIcons.users,
            onTap: () {
              _sidebarController.selectedId.value = 2;
              _rootController.pageIndex.value = 2;
            },
          ),
          SidebarIcon(
            id: 3,
            icon: Iconsax.setting,
            onTap: () {
              _sidebarController.selectedId.value = 3;
              _rootController.pageIndex.value = 3;
            },
          ),
        ],
      ),
    );
  }
}
