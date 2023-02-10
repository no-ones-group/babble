import 'dart:developer';

import 'package:babble/Onboarding/new_login_screen.dart';
import 'package:babble/api/message_space_api.dart';
import 'package:babble/api/user_api.dart';
import 'package:babble/models/space.dart';
import 'package:babble/models/user.dart';
import 'package:babble/ui/root.dart';
import 'package:babble/ui/root_controller.dart';
import 'package:babble/ui/sidebar/sidebar_controller.dart';
import 'package:babble/ui/space/chat_space/chat_space_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

enum Configuration {
  debug,
  profile,
  release,
}

late Configuration configuration;

void test() {
  String uid = const Uuid().v1();
  User user = User(
    id: uid,
    fullName: 'test userName',
    displayName: 'test displayName',
  );

  UserAPI().createUser(user);
  UserAPI().createSpace(Space(
    createdBy: user,
    createdTime: Timestamp.now(),
    admins: [user],
    users: [],
  ));
  log(uid);
}

void main() async {
  String env = const String.fromEnvironment("env", defaultValue: "debug");
  configuration = env == "debug" ? Configuration.debug : Configuration.profile;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put<SidebarController>(SidebarController());
  Get.put<RootController>(RootController());
  Get.put<ChatSpaceController>(ChatSpaceController());
  // test();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Babble',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      home: SafeArea(
        child: configuration == Configuration.profile
            ? Root()
            : const NewLoginScreen(),
      ),
    );
  }
}
