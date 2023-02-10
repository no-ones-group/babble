import 'package:babble/api/message_api.dart';
import 'package:babble/api/message_space_api.dart';
import 'package:babble/models/space.dart';
import 'package:babble/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserAPI {
  final FirebaseFirestore _instance = FirebaseFirestore.instance;

  void createUser(User user) {
    _instance.collection('users').doc(user.id).set({
      'displayName': user.displayName,
      'id': user.id,
      'profilePicLink': user.profilePicLink,
      'spaces': [],
      'username': user.fullName,
    });
  }

  Future<bool> checkUserWithPhoneNumber(String phoneNumber) async {
    bool result = false;
    await _instance.collection('users').snapshots().forEach((element) {
      for (var doc in element.docs) {
        String temp = doc.get('phoneNumber');
        if (temp == phoneNumber) {
          result = true;
          break;
        }
      }
    });
    return result;
  }

  Future<void> addSpace(User user, Space space) async {
    await _instance.collection('users').doc(user.id).update({
      'spaces': FieldValue.arrayUnion(
          [_instance.collection('messageSpaces').doc(space.uuid)])
    });
  }

  Future<void> createSpace(Space space) async {
    await MessageSpaceAPI().createSpace(space);
    await addSpace(space.createdBy, space);
  }
}
