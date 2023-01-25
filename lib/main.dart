import 'dart:developer';

import 'package:babble/Onboarding/log_in.dart';
import 'package:babble/Onboarding/new_login.dart';
import 'package:babble/api/authentication.dart';
import 'package:babble/ui/root.dart';
import 'package:babble/ui/root_controller.dart';
import 'package:babble/ui/sidebar/sidebar_controller.dart';
import 'package:babble/ui/space/chat_space/chat_space_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum Configuration {
  debug,
  profile,
  release,
}

late Configuration configuration;

Future<void> main() async {
  String env = const String.fromEnvironment("env", defaultValue: "release");
  configuration = env == "debug" ? Configuration.debug : Configuration.profile;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put<SidebarController>(SidebarController());
  Get.put<RootController>(RootController());
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
        child: configuration == Configuration.debug ? Root() : const NewLogin(),
      ),
    );
  }
}
