// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:note_me/screens/login.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

class _HomeState extends State<Home> {
  GoogleSignInAccount? user = _googleSignIn.currentUser;
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          actions: [
            ElevatedButton(
              child: const Text("Sign out"),
              onPressed: user != null
                  ? null
                  : () async {
                      await _googleSignIn.signOut();

                      Navigator.pop(context);
                    },
            ),
          ],
        ),
        body: Center(
          child: Text("hi"),
        ),
      );
}
