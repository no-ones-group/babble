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
      var data = await firestoreInstance
          .collection('messageSpaces')
          .doc(space.uuid)
          .get();
      spaces.add(Space.fromFirebase(
        uuid: data.get('uuid'),
        createdBy: data.get('createdBy'),
        createdTime: data.get('createdTime'),
        admins: data.get('admins'),
        users: data.get('users'),
      ));
    }
    return spaces;
  }

  Future<void> createSpace(Space space) async {
    await firestoreInstance.collection('messageSpaces').doc(space.uuid).set({
      'admin': [firestoreInstance.doc(space.createdBy)],
      'users': [firestoreInstance.doc(space.createdBy)],
    });
    List<DocumentReference> docs = [];
    for (String user in space.users) {
      docs.add(firestoreInstance.doc(user));
    }
    await firestoreInstance
        .collection('messageSpaces')
        .doc(space.uuid)
        .update({'users': FieldValue.arrayUnion(docs)});
  }
}
