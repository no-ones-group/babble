import 'space.dart';

class User {
  final int id;
  final String username;
  final String firstname;
  final String lastname;
  final List<Space> spaces;

  const User({
    required this.id,
    required this.username,
    required this.firstname,
    required this.lastname,
    required this.spaces,
  });
}
