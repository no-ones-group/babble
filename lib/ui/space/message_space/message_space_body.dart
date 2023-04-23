import 'package:babble/constants/root_constants.dart';
import 'package:babble/models/message_model.dart';
import 'package:babble/models/space.dart';
import 'package:babble/ui/root_controller.dart';
import 'package:babble/ui/space/chat_space/chat_space_controller.dart';
import 'package:babble/ui/space/message_space/widgets/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageSpaceBody extends StatelessWidget {
  final _rootController = Get.find<RootController>();
  final _chatController = Get.find<ChatSpaceController>();
  MessageSpaceBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 5, right: 5),
      height: MediaQuery.of(context).size.height - 120,
      width: MediaQuery.of(context).size.width - RootConstants().sidebarWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Container(
            child: Flexible(
              child: SingleChildScrollView(
                child: Column(
                  children: [],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
