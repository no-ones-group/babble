import 'dart:developer';

import 'package:babble/api/user_api.dart';
import 'package:babble/models/space.dart';
import 'package:babble/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageSpaceAPI {
  var firestoreInstance = FirebaseFirestore.instance;

  void getSpace(String uuid) {}

  Future<List<Space>> getSpaces(User user) async {
    List<Space> spaces = [];
    for (var space in user.spaces) {
      log('==>> $space');
      spaces.add(Space.fromFirestore(
          firestoreInstance.collection('messageSpaces').doc(space)));
    }
    return spaces;
  }

  Future<void> createSpace(Space space) async {
    await firestoreInstance.collection('messageSpaces').doc(space.uuid).set({
      'admin': [firestoreInstance.doc(space.createdBy.id)],
      'users': [firestoreInstance.doc(space.createdBy.id)],
    });
    List<DocumentReference> docs = [];
    for (var user in space.users) {
      docs.add(user);
    }
    await firestoreInstance
        .collection('messageSpaces')
        .doc(space.uuid)
        .update({'users': FieldValue.arrayUnion(docs)});
  }
}
