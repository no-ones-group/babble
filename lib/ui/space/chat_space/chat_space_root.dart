import 'package:babble/ui/space/chat_space/chat_tiles.dart';
import 'package:flutter/material.dart';

class ChatSpaceRoot extends StatelessWidget {
  const ChatSpaceRoot({super.key});

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
