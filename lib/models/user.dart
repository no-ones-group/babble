import 'space.dart';

class User {
  final String id;
  final String? profilePicLink;
  final String fullName;
  final String displayName;
  final List<Space> spaces;

  const User({
    required this.id,
    this.profilePicLink,
    required this.fullName,
    required this.displayName,
    this.spaces = const [],
  });
}
