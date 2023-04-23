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
        profilePicLink: data.get(UserField.profilePicLink.name),
        displayName: data.get(UserField.displayName.name),
        fullName: data.get(UserField.fullName.name),
        spaces: (data.get(UserField.spaces.name) as List)
            .map((item) => item as String)
            .toList(),
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
      UserField.displayName.name: user.displayName,
      UserField.id.name: user.id,
      UserField.profilePicLink.name: user.profilePicLink,
      UserField.spaces.name: [],
      UserField.fullName.name: user.fullName,
    });
  }

  Future<bool> isUserAlreadyRegistered(String phoneNumber) async =>
      (await _instance.collection('users').doc(phoneNumber).get()).exists;

  Future<void> addSpace(String userId, Space space) async {
    await _instance.collection('users').doc(userId).update({
      UserField.spaces.name: FieldValue.arrayUnion(
          [_instance.collection('messageSpaces').doc(space.uuid)])
    });
  }

  Future<void> createSpace(Space space) async {
    await MessageSpaceAPI().createSpace(space);
    await addSpace(space.createdBy.id, space);
  }
}
