import 'package:babble/constants/sidebar_constants.dart';
import 'package:babble/models/user.dart';
import 'package:babble/ui/root_controller.dart';
import 'package:babble/ui/sidebar/sidebar_root.dart';
import 'package:babble/ui/space/chat_space/chat_space_root.dart';
import 'package:babble/ui/space/setting_space/setting_space_root.dart';
import 'package:babble/ui/space/space_root.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'space/message_space/message_space_root.dart';

class Root extends StatelessWidget {
  final RootController _rootController = Get.find<RootController>();
  Root({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Container(
          height: MediaQuery.of(context).size.height,
          color: SidebarConstants().sidebarColor,
          child: Row(
            children: [
              SidebarRoot(),
              SpaceRoot(
                title:
                    _rootController.pageTitles[_rootController.pageIndex.value],
                body: _rootController.pageIndex.value == 1
                    ? const ChatSpaceRoot()
                    : const SettingSpaceRoot(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
