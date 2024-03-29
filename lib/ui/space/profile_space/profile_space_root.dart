import 'dart:developer';

import 'package:babble/api/user_api.dart';
import 'package:babble/models/user.dart';
import 'package:babble/ui/space/profile_space/profile_space_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileSpaceRoot extends StatefulWidget {
  const ProfileSpaceRoot({super.key});

  @override
  State<ProfileSpaceRoot> createState() => _ProfileSpaceRootState();
}

class _ProfileSpaceRootState extends State<ProfileSpaceRoot> {
  final ProfileSpaceController _profileSpaceController =
      Get.find<ProfileSpaceController>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: UserAPI().getUser(
          _profileSpaceController.rootController.loggedInUserPhoneNumber),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (!snapshot.hasError ||
              (snapshot.hasData && snapshot.data != null)) {
            double radius = MediaQuery.of(context).size.width * 0.25;
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: CircleAvatar(
                        backgroundColor: Colors.black12,
                        radius: radius <= 200 ? radius : 200,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Display Name'),
                          Text(snapshot.data!.displayName),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Full Name'),
                          Text(snapshot.data!.fullName),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        }
        return const CircularProgressIndicator(
          color: Colors.red,
        );
      }),
    );
  }
}
