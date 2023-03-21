import 'package:babble/constants/space_root_constants.dart';
import 'package:babble/ui/space/chat_space/chat_space_controller.dart';
import 'package:babble/ui/space/chat_space/chat_tiles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatSpaceRoot extends StatelessWidget {
  final ChatSpaceController _chatSpaceController =
      Get.put(ChatSpaceController());
  ChatSpaceRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemCount: 15,
        itemBuilder: (context, index) => ChatTiles(index),
      ),
    );
  }
}
