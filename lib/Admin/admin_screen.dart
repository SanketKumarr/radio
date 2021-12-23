import 'package:flutter/material.dart';
import 'package:radio_lnct/Admin/create_interview.dart';
import 'package:radio_lnct/Admin/create_post.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CreatePost()));
              },
              child: Text("Post"),
              textColor: Colors.white,
              color: Color(0xff242a54),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CreateInterview()));
              },
              child: Text("Interview"),
              textColor: Colors.white,
              color: Color(0xff242a54),
            ),
          ],
        ),
      ),
    );
  }
}
