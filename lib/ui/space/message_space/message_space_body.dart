import 'package:babble/constants/root_constants.dart';
import 'package:flutter/material.dart';

class MessageSpaceBody extends StatelessWidget {
  const MessageSpaceBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 5, right: 5),
      height: MediaQuery.of(context).size.height - 120,
      width:
          MediaQuery.of(context).size.width - RootConstants().sidebarWidth,
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Container(
            child: const Text('Hello World!'),
          ),
        ],
      ),
    );
  }
}
