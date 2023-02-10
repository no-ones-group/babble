import 'package:babble/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class Space {
  String uuid = const Uuid().v1();
  final User createdBy;
  final Timestamp createdTime;
  final List<User> admins;
  final List<User> users;

  Space({
    required this.createdBy,
    required this.createdTime,
    required this.admins,
    required this.users,
  });

  Space.fromFirebase({
    required this.uuid,
    required this.createdBy,
    required this.createdTime,
    required this.admins,
    required this.users,
  });
}
