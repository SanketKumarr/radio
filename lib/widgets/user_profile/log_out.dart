import 'package:flutter/material.dart';

Future<void> logoutConfirmation(BuildContext context) async {
  return showDialog<void>(
    context: context,
    // barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Padding(
          padding: EdgeInsets.only(left: 18),
          child: Text(
            "You will be logged out.",
            style: TextStyle(
              color: Color(0xff242a54),
            ),
          ),
        ),
        content: SizedBox(
          height: 50,
          // color: Colors.yellow,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "OK",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Cancel",
                      style: TextStyle(
                        color: Color(0xff242a54),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
