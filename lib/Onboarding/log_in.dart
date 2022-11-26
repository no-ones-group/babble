import 'package:babble/ui/root.dart';
import 'package:flutter/material.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
        backgroundColor: const Color.fromARGB(255, 13, 22, 54),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 150.0,
              width: 190.0,
              padding: const EdgeInsets.only(top: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
              ),
              child: Image.asset('assets/babble_logo.png'),
            ),
            const SizedBox(
              // <-- SEE HERE
              width: 400,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                      hintText: 'Enter valid mail id as abc@gmail.com'),
                ),
              ),
            ),
            const SizedBox(
              // <-- SEE HERE
              width: 400,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter your secure password'),
                ),
              ),
            ),
            Container(
                height: 50,
                width: 200,
                color: Colors.blue,
                child: ElevatedButton(
                  // onPressed: () {},
                  onPressed: (() {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => Root()),
                        (route) => false);
                  }),
                  // onPressed: () {},
                  child: const Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  ),
                )),
            const SizedBox(
              height: 130,
            ),
            const Text('New User? Create Account'),
          ],
        ),
      ),
    );
  }
}
