import 'dart:developer';

import 'package:babble/api/message_space_api.dart';
import 'package:babble/models/space.dart';
import 'package:babble/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserAPI {
  final FirebaseFirestore _instance = FirebaseFirestore.instance;

  Future<User> getUser(String phoneNumber) async {
    if (await isUserAlreadyRegistered(phoneNumber)) {
      var data = await _instance.collection('users').doc(phoneNumber).get();
      User user = User(
        id: phoneNumber,
        displayName: data.get('displayName'),
        fullName: data.get('fullName'),
      );
      return user;
    }
    return User(
      id: phoneNumber,
      displayName: 'defaultData',
      fullName: 'defaultData',
    );
  }

  void createUser(User user) {
    _instance.collection('users').doc(user.id).set({
      'displayName': user.displayName,
      'id': user.id,
      'profilePicLink': user.profilePicLink,
      'spaces': [],
      'fullName': user.fullName,
    });
  }

  Future<bool> isUserAlreadyRegistered(String phoneNumber) async =>
      (await _instance.collection('users').doc(phoneNumber).get()).exists;

  Future<void> addSpace(String userId, Space space) async {
    await _instance.collection('users').doc(userId).update({
      'spaces': FieldValue.arrayUnion(
          [_instance.collection('messageSpaces').doc(space.uuid)])
    });
  }

  Future<void> createSpace(Space space) async {
    await MessageSpaceAPI().createSpace(space);
    await addSpace(space.createdBy, space);
  }
}
