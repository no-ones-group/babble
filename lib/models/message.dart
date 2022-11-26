import 'space.dart';
import 'user.dart';

class Message {
  final int id;
  final String? message;
  final MessageType messageType;
  final Message? replyingTo;
  final User by;
  final User? to;
  final Space chatSpace;

  const Message({
    required this.id,
    this.message,
    this.messageType = MessageType.text,
    this.replyingTo,
    required this.by,
    this.to,
    required this.chatSpace,
  });
}

enum MessageType {
  text,
  image,
  video,
  audio,
}
