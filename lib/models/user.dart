import 'space.dart';

class User {
  final String id;
  final String? profilePicLink;
  final String username;
  final String displayName;
  final List<Space>? spaces;

  const User({
    required this.id,
    this.profilePicLink,
    required this.username,
    required this.displayName,
    this.spaces,
  });
}
