import 'package:cloud_firestore/cloud_firestore.dart';

import 'space.dart';
import 'user.dart';

class MessageModel {
  final String id;
  final String content;
  final MessageType messageType;
  final String? replyingTo;
  final User by;
  final User? to;
  final Timestamp sentTime;
  final Space chatSpace;

  const MessageModel({
    required this.id,
    required this.content,
    this.messageType = MessageType.text,
    this.replyingTo,
    required this.by,
    this.to,
    required this.sentTime,
    required this.chatSpace,
  });
}

enum MessageField {
  id,
  content,
  messageType,
  replyingTo,
  by,
  to,
  sentTime,
  chatSpace,
}

enum MessageType {
  text,
  image,
  video,
  audio,
}

enum ReadReceipt {
  seen,
  delivered,
  sent,
  notSent,
}
