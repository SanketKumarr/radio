import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:radio_lnct/utils/google_sign_in.dart';

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
                final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.googleLogIn();
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
            RichText(
              text: TextSpan(
                  text: "Already have an account.?",
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
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
