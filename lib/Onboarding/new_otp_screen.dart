import 'package:babble/api/authentication.dart';
import 'package:babble/ui/root.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewOTPScreen extends StatelessWidget {
  final String phoneNumber;
  const NewOTPScreen(this.phoneNumber, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'BABBLE',
                style: GoogleFonts.poppins(
                  fontSize: 25,
                  color: Colors.amber,
                  fontWeight: FontWeight.w700,
                ),
              ),
              FutureBuilder(
                future: Authentication().signInWeb(phoneNumber),
                builder: ((context, snapshot) {
                  return TextField(
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    onSubmitted: (value) async {
                      if (snapshot.hasData) {
                        final navigator = Navigator.of(context);
                        await Authentication().verify(snapshot.data!, value);
                        navigator.push(
                            MaterialPageRoute(builder: ((context) => Root())));
                      }
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
