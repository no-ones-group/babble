import 'package:babble/constants/root_constants.dart';
import 'package:babble/constants/space_root_constants.dart';
import 'package:babble/models/message_model.dart';
import 'package:babble/models/space.dart';
import 'package:babble/models/user.dart';
import 'package:babble/ui/extended_sidebar/extended_sidebar_controller.dart';
import 'package:babble/ui/root_controller.dart';
import 'package:babble/ui/space/message_space/widgets/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class MessageSpaceFooter extends StatelessWidget {
  final _rootController = Get.find<RootController>();
  final _extendedSidebarController = Get.find<ExtendedSidebarController>();
  final _textEditingController = TextEditingController();
  MessageSpaceFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: RootConstants.footerHeight,
      width: MediaQuery.of(context).size.width - RootConstants().sidebarWidth,
      color: SpaceRootConstants().containerColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.emoji_emotions),
          ),
          Expanded(
            child: SizedBox(
              height: 40,
              child: TextField(
                style: const TextStyle(
                  color: Color.fromARGB(255, 255, 184, 78),
                ),
                controller: _textEditingController,
                cursorColor: const Color.fromARGB(255, 73, 218, 238),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: const BorderSide(
                      width: 3,
                      color: Color.fromARGB(255, 73, 218, 238),
                    ),
                  ),
                ),
                onSubmitted: (value) {
                  _extendedSidebarController
                      .selectedChat.value.messagesCollection
                      .add({
                    MessageModel.byField:
                        _rootController.user.userDocumentReference,
                    MessageModel.chatSpaceField: _extendedSidebarController
                        .selectedChat.value.spaceDocumentReference,
                    MessageModel.contentField: _textEditingController.text,
                    MessageModel.idField: const Uuid().v1(),
                    MessageModel.messageTypeField: MessageType.text.name,
                    MessageModel.replyingToField: null,
                    MessageModel.sentTimeField: Timestamp.now(),
                  });
                  _textEditingController.text = '';
                },
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}
