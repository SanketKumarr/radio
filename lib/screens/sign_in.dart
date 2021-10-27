import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
          ),
          Lottie.asset(
            "assets/illustrations/sign_in_lottie.json",
          ),
          SizedBox(
            height: 250,
          ),
          ElevatedButton.icon(
            onPressed: () {},
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 3),
              child: Icon(
                FontAwesomeIcons.google,
                size: 18,
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
          Text(
            "Already have an account.? Log in",
            style: TextStyle(
              fontFamily: "ProductSans",
              fontWeight: FontWeight.w300,
              color: Color(0xff242a54),
            ),
          ),
        ],
      ),
    );
  }
}
