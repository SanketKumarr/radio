import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ArtAndCraft extends StatelessWidget {
  const ArtAndCraft({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var date = DateFormat('dd-MM-yyyy').format(DateTime.now()).toString();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Transform.translate(
                        offset: Offset(-5, 0),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                          ),
                          color: Color(0xff242a54),
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          iconSize: 18,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 40),
                        child: Text(
                          "Art & craft",
                          style: TextStyle(
                            color: Color(0xff242a54),
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          // height: ,
                          child: Text(date + ":",
                              style: const TextStyle(
                                fontSize: 15,
                                color: Color(0xff242a54),
                              )),
                          // color: Colors.grey[200],
                        ),
                      ),
                      Row(),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}