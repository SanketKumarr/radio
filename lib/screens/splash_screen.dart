import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:radio_lnct/bottom_app_bar.dart';
import 'package:radio_lnct/screens/sign_in.dart';
import 'package:radio_lnct/utils/between_auth_and_home_page.dart';

class MySplash extends StatefulWidget {
  const MySplash({Key? key}) : super(key: key);

  @override
  _MySplashState createState() => _MySplashState();
}

class _MySplashState extends State<MySplash> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  void _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 6), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const BetweenAuthAndHomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                "assets/images/lnct_radio.png",
                height: 130,
              ),
            ),
            Transform.translate(
              offset: Offset(0, 250),
              child: Lottie.asset(
                "assets/illustrations/loading_1.json",
                height: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
