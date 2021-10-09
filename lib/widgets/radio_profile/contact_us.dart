import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Contact us",
            style: TextStyle(
              fontFamily: "ProductSans",
              fontWeight: FontWeight.w400,

              color: Color(0xff242a54),
              fontSize: 22,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  launch("https://instagram.com/lnctradio?utm_medium=copy_link");
                },
                child: Container(
                  child: Row(
                    children: [
                      Icon(FontAwesomeIcons.instagram, color: Color(0xff242a54),),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Instagram",
                        style: TextStyle(
                          color: Color(0xff242a54),
                          fontSize: 18,
                          fontFamily: "ProductSans",
                          fontWeight: FontWeight.w300,

                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 100,
              ),
              InkWell(
                onTap: () {
                  launch("https://www.linkedin.com/in/lnct-radio-1aa686201");
                },
                child: Container(
                  child: Row(
                    children: [
                      Icon(FontAwesomeIcons.linkedin, color: Color(0xff242a54),),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "LinkedIn",
                        style: TextStyle(
                          color: Color(0xff242a54),
                          fontSize: 18,
                          fontFamily: "ProductSans",
                          fontWeight: FontWeight.w300,

                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}