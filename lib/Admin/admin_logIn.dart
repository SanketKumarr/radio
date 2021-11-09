import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:radio_lnct/Admin/create_post.dart';

class AdminLogIn extends StatefulWidget {
  const AdminLogIn({Key? key}) : super(key: key);

  @override
  _AdminLogInState createState() => _AdminLogInState();
}

class _AdminLogInState extends State<AdminLogIn> {
  final TextEditingController keyController = TextEditingController();
  String msg = "";

  @override
  Widget build(BuildContext context) {
    // final Stream<QuerySnapshot> members =
    //     FirebaseFirestore.instance.collection('members').snapshots();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: keyController,
                decoration: InputDecoration(
                  hintText: "Key",
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            MaterialButton(
              child: Text("Log in"),
              color: Color(0xff242a54),
              textColor: Colors.white,
              onPressed: () {
                FirebaseFirestore.instance
                    .collection('members')
                    .doc('Key')
                    .get()
                    .then((querySnapshot) {
                  if (querySnapshot.data()!.containsValue(keyController.text)) {
                    print('Keys matched');
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => CreatePost()));
                  } else {
                    msg = "Keys don't match";
                    print("Keys don't match");
                  }
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              msg,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
