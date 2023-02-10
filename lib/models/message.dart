import 'space.dart';
import 'user.dart';

class Message {
  final String id;
  final String? content;
  final MessageType messageType;
  final String? replyingTo;
  final User by;
  final User? to;
  final Space chatSpace;

  const Message({
    required this.id,
    this.content,
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
