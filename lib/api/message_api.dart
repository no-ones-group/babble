import 'package:babble/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class MessageAPI {
  var firebaseFirestoreInstance = FirebaseFirestore.instance;

  void sendMessage(Message msg) async {
    String uuid = const Uuid().v1();
    await firebaseFirestoreInstance.collection('Message').doc(uuid).set({
      'id': uuid,
      'by': msg.by,
      'to': msg.to,
      'messageType': msg.messageType,
      'replyingTo': msg.replyingTo,
      'chatSpace': msg.chatSpace,
      'content': msg.content,
    });
  }

  void deleteMessage(String id) {}

  void replyToMessage(
    int replyMessageID,
  ) {}
}
