import 'dart:developer';

import 'package:babble/Onboarding/new_login_screen.dart';
import 'package:babble/api/user_api.dart';
import 'package:babble/models/space.dart';
import 'package:babble/models/user.dart';
import 'package:babble/ui/root.dart';
import 'package:babble/ui/root_controller.dart';
import 'package:babble/ui/sidebar/sidebar_controller.dart';
import 'package:babble/ui/space/chat_space/chat_space_controller.dart';
import 'package:babble/ui/space/profile_space/profile_space_controller.dart';
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

void main() async {
  String env = const String.fromEnvironment("env", defaultValue: "debug");
  configuration = env == "debug" ? Configuration.debug : Configuration.profile;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put<RootController>(RootController());
  Get.put<SidebarController>(SidebarController());
  Get.put<ProfileSpaceController>(ProfileSpaceController());
  Get.put<ChatSpaceController>(ChatSpaceController());
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
        child: configuration == Configuration.debug ? Root() : NewLoginScreen(),
      ),
    );
  }
}
