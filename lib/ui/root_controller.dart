import 'package:babble/api/user_api.dart';
import 'package:babble/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootController extends GetxController {
  var pageTitle = ''.obs;
  String loggedInUserPhoneNumber = '1';
  Widget pageContent = const SizedBox(
    child: Center(
      child: Text('Welcome to Babble Land!'),
    ),
  );
  var user = User.defaultV1();
  late DocumentReference userDoc;

  void setPage(Widget page, String title) {
    pageTitle.value = title;
    pageContent = page;
  }

  @override
  void onInit() async {
    userDoc = FirebaseFirestore.instance
        .collection('users')
        .doc(loggedInUserPhoneNumber);
    user = await UserAPI().getUser(loggedInUserPhoneNumber);
    super.onInit();
  }
}
