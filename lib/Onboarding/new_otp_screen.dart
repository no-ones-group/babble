import 'package:babble/Onboarding/user_details_form.dart';
import 'package:babble/api/authentication_api.dart';
import 'package:babble/api/user_api.dart';
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
                future: AuthenticationAPI().signInWeb(phoneNumber),
                builder: ((context, snapshot) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: TextField(
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      onSubmitted: (value) async {
                        var nav = Navigator.of(context);
                        if (snapshot.hasData) {
                          await AuthenticationAPI()
                              .verifyOTP(snapshot.data!, value);
                          if (await UserAPI()
                              .isUserAlreadyRegistered(phoneNumber)) {
                            nav.push(MaterialPageRoute(
                                builder: ((context) => Root())));
                          } else {
                            nav.push(MaterialPageRoute(
                                builder: ((context) => UserDetailsForm())));
                          }
                        }
                      },
                    ),
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
