import 'package:babble/constants/root_constants.dart';
import 'package:babble/constants/space_root_constants.dart';
import 'package:flutter/material.dart';

class SpaceRoot extends StatelessWidget {
  final bool needBottom;
  final String title;
  final Widget body;
  const SpaceRoot(
      {super.key,
      required this.title,
      required this.body,
      this.needBottom = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: RootConstants().spaceWidth,
      height: MediaQuery.of(context).size.height,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(title),
          toolbarHeight: SpaceRootConstants().headerHeight,
        ),
        body: body,
      ),
    );
  }
}
