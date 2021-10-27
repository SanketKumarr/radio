import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:radio_lnct/bottom_app_bar.dart';
import 'package:radio_lnct/screens/sign_in.dart';

class BetweenAuthAndHomePage extends StatefulWidget {
  const BetweenAuthAndHomePage({Key? key}) : super(key: key);

  @override
  _BetweenAuthAndHomePageState createState() => _BetweenAuthAndHomePageState();
}

class _BetweenAuthAndHomePageState extends State<BetweenAuthAndHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return Structure();
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                "Something went wrong",
              ),
            );
          }
          else {
            return SignIn();
          }
        },
      ),
    );
  }
}
