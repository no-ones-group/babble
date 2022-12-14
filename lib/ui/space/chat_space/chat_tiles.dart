import 'package:babble/constants/sidebar_constants.dart';
import 'package:babble/ui/space/chat_space/chat_space_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatTiles extends StatelessWidget {
  final int id;
  final ChatSpaceController _chatSpaceController =
      Get.find<ChatSpaceController>();
  ChatTiles(this.id, {super.key});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        _chatSpaceController.selectedChat.value = id;
      },
      onExit: (_) {
        _chatSpaceController.selectedChat.value = -1;
      },
      child: Obx(
        () => Card(
          elevation: _chatSpaceController.selectedChat.value == id ? 10 : 0,
          color: _chatSpaceController.selectedChat.value == id
              ? SidebarConstants().sidebarIconColor
              : SidebarConstants().sidebarColor,
          margin: const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 2.5),
          child: Container(
            height: 70,
            child: Text(
              id.toString(),
              style: TextStyle(
                color: SidebarConstants().sidebarIconColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
