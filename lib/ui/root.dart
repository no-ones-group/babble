import 'package:babble/constants/sidebar_constants.dart';
import 'package:babble/models/space.dart';
import 'package:babble/ui/extended_sidebar/extended_sidebar_controller.dart';
import 'package:babble/ui/extended_sidebar/extended_sidebar_root.dart';
import 'package:babble/ui/root_controller.dart';
import 'package:babble/ui/sidebar/sidebar_root.dart';
import 'package:babble/ui/space/message_space/message_space_root.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Root extends StatelessWidget {
  final RootController _rootController = Get.find<RootController>();
  final ExtendedSidebarController _extendedSidebarController =
      Get.find<ExtendedSidebarController>();
  Root({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        color: SidebarConstants().sidebarColor,
        child: Row(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: SidebarRoot(),
            ),
            Align(
              alignment: Alignment.center,
              child: ExtendedSidebarRoot(),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: _extendedSidebarController.selectedChat.value ==
                      Space.defaultV1()
                  ? const SizedBox()
                  : MessageSpaceRoot(),
            ),
          ],
        ),
      ),
    );
  }
}
