import 'space.dart';

class User {
  final int id;
  final String? profilePicLink;
  final String username;
  final String firstname;
  final String lastname;
  final List<Space>? spaces;

  const User({
    required this.id,
    this.profilePicLink,
    required this.username,
    required this.firstname,
    required this.lastname,
    this.spaces,
  });
}
