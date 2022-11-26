import 'package:babble/constants/root_constants.dart';
import 'package:babble/ui/space/message_space/message_space_body.dart';
import 'package:babble/ui/space/message_space/message_space_header.dart';
import 'package:flutter/material.dart';

class MessageSpaceRoot extends StatelessWidget {
  const MessageSpaceRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      width: MediaQuery.of(context).size.width - RootConstants().sidebarWidth,
      child: Column(
        children: const [
          MessageSpaceHeader(),
          MessageSpaceBody(),
        ],
      ),
    );
  }
}
