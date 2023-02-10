import 'package:babble/models/user.dart';
import 'package:flutter/material.dart';

class ProfileSpaceRoot extends StatelessWidget {
  final User user;
  const ProfileSpaceRoot({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(user.fullName),
          Text(user.displayName),
        ],
      ),
    );
  }
}
