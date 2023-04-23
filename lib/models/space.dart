import 'package:babble/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class Space {
  String uuid = const Uuid().v1();
  late final DocumentReference createdBy;
  late final Timestamp createdTime;
  late final List<DocumentReference> admins;
  late final List<DocumentReference> users;

  Space({
    required this.createdBy,
    required this.createdTime,
    required this.admins,
    required this.users,
  });

  Space.fromFirestore(DocumentReference docRef) {
    docRef.get().then((data) {
      uuid = data.get(SpaceField.uuid.name) as String;
      createdBy = (data.get(SpaceField.createdBy.name) as DocumentReference);
      createdTime = data.get(SpaceField.createdTime) as Timestamp;
      admins = (data.get(SpaceField.admin.name) as List)
          .map((item) => item as DocumentReference)
          .toList();
      users = (data.get(SpaceField.users.name) as List)
          .map((item) => item as DocumentReference)
          .toList();
    });
  }
}

enum SpaceField {
  uuid,
  createdBy,
  createdTime,
  admin,
  users,
}
