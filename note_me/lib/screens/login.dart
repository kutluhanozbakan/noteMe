import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:note_me/provider/google_sign_in.dart';
import 'package:note_me/screens/homepage.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  @override
  Widget build(BuildContext context) {
    GoogleSignInAccount? user = _googleSignIn.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Google " + (user == null ? 'out' : 'in'),
        ),
      ),
      backgroundColor: Colors.grey[850],
      body: Center(
          child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 350),
          child: Column(
            children: [
              ElevatedButton(
                child: const Text("Sign in"),
                onPressed: user != null
                    ? null
                    : () async {
                        await _googleSignIn.signIn();

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                        );
                      },
              ),
            ],
          ),
        )
      ])),
    );
  }
}
