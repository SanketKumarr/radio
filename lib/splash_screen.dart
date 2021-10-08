import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:radio_lnct/bottom_app_bar.dart';

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
        builder: (context) => const Structure(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Center(
              child: Image.asset(
                "assets/images/lnct_radio.png",
                height: 130,
              ),
            ),
            Positioned(
              bottom: 1,
              child: Lottie.asset(
                "assets/videos/loading_1.json",
                height: 120,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
