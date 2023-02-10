import 'package:babble/api/user_api.dart';
import 'package:babble/models/space.dart';
import 'package:babble/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageSpaceAPI {
  var firestoreInstance = FirebaseFirestore.instance;

  void getSpace(String uuid) {}

  void getSpaces(User user) {}

  Future<void> createSpace(Space space) async {
    await firestoreInstance.collection('messageSpaces').doc(space.uuid).set({
      'admin': [firestoreInstance.collection('users').doc(space.createdBy.id)],
      'users': [firestoreInstance.collection('users').doc(space.createdBy.id)],
    });
    List<DocumentReference> docs = [];
    for (User user in space.users) {
      docs.add(firestoreInstance.collection('users').doc(user.id));
    }
    await firestoreInstance
        .collection('messageSpaces')
        .doc(space.uuid)
        .update({'users': FieldValue.arrayUnion(docs)});
  }
}
