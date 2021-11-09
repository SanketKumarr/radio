import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:radio_lnct/Admin/admin_logIn.dart';
import 'package:radio_lnct/Admin/create_post.dart';
import 'package:radio_lnct/utils/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
            ),
            Lottie.asset(
              "assets/illustrations/sign_in_lottie.json",
              height: 300,
            ),
            SizedBox(
              height: 250,
            ),
            ElevatedButton.icon(
              onPressed: () {
                // var firebaseUser = FirebaseAuth.instance.currentUser;
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.googleLogIn().then((onValue) {
                  // saving user sign in info in firestore
                  FirebaseFirestore.instance
                      .collection('users')
                      .doc('google_users')
                      .collection('users')
                      .add(
                    {
                      'email': email,
                      'name': name,
                      'uid': uid,
                      'photoURL': photoURL,
                    },
                  );
                }).catchError((e) {
                  print(e);
                });
              },
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 3),
                child: Icon(
                  FontAwesomeIcons.google,
                  size: 20,
                ),
              ),
              label: Text(
                "SIGN IN WITH GOOGLE",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "ProductSans",
                  fontWeight: FontWeight.w500,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Color(0xff242a54),
                fixedSize: Size(240, 40),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdminLogIn(),
                  ),
                );
              },
              child: RichText(
                text: TextSpan(
                  text: "Club member.?",
                  style: TextStyle(
                    fontFamily: "ProductSans",
                    fontWeight: FontWeight.w300,
                    color: Color(0xff242a54),
                  ),
                  children: [
                    TextSpan(
                      text: " Log in",
                      style: TextStyle(
                        fontFamily: "ProductSans",
                        fontWeight: FontWeight.w300,
                        color: Color(0xff242a54),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
