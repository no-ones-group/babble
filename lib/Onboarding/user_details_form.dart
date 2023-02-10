import 'package:babble/ui/root.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserDetailsForm extends StatelessWidget {
  UserDetailsForm({super.key});
  final _displayNameController = TextEditingController();
  final _fullNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            style: GoogleFonts.poppins(),
            decoration: const InputDecoration(hintText: 'Display Name'),
            controller: _displayNameController,
          ),
          TextField(
            style: GoogleFonts.poppins(),
            decoration: const InputDecoration(hintText: 'Full Name'),
            controller: _fullNameController,
          ),
          TextButton(
            onPressed: () {
              Navigator.popUntil(context, (route) => true);
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: ((context) => Root())));
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
