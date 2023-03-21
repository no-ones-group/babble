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
                  children: [
                    Message(
                      messageModel: MessageModel(
                        id: '1',
                        messageType: MessageType.text,
                        content: 'content',
                        by: _rootController.user,
                        sentTime: Timestamp.now(),
                        chatSpace: Space(
                          createdBy: _rootController.user.id,
                          createdTime: Timestamp.now(),
                          admins: [],
                          users: [_rootController.user.id],
                        ),
                      ),
                    ),
                    Message(
                      messageModel: MessageModel(
                        id: '1',
                        messageType: MessageType.image,
                        sentTime: Timestamp.now(),
                        content: 'content',
                        by: _rootController.user,
                        chatSpace: Space(
                          createdBy: _rootController.user.id,
                          createdTime: Timestamp.now(),
                          admins: [],
                          users: [_rootController.user.id],
                        ),
                      ),
                    ),
                    Message(
                      messageModel: MessageModel(
                        id: '1',
                        messageType: MessageType.audio,
                        sentTime: Timestamp.now(),
                        content: 'content',
                        by: _rootController.user,
                        chatSpace: Space(
                          createdBy: _rootController.user.id,
                          createdTime: Timestamp.now(),
                          admins: [],
                          users: [_rootController.user.id],
                        ),
                      ),
                    ),
                    Message(
                      messageModel: MessageModel(
                        id: '1',
                        messageType: MessageType.video,
                        content: 'content',
                        sentTime: Timestamp.now(),
                        by: _rootController.diffUser,
                        chatSpace: Space(
                          createdBy: _rootController.user.id,
                          createdTime: Timestamp.now(),
                          admins: [],
                          users: [_rootController.user.id],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
