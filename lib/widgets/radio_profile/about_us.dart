import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "About us",
            style: TextStyle(
              fontFamily: "ProductSans",
              fontWeight: FontWeight.w400,

              color: Color(0xff242a54),
              fontSize: 22,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Freedom is the only ascension, the only guarantee of attraction. The moon has zen, but not everyone grasps it. The lama has result, but not everyone remembers it. Who can hear the trust and death of a source if he has the atomic control of the moon?. An unveiled form of anger is the vision.",
              style: TextStyle(
                fontFamily: "ProductSans",
                fontWeight: FontWeight.w300,

                color: Color(0xff242a54),
              ),
              overflow: TextOverflow.fade,
              maxLines: 4,
              // softWrap: true,
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 15, left: 230),
          //   child: InkWell(
          //     onTap: () {},
          //     child: Container(
          //       width: 90,
          //       height: 30,
          //       decoration: BoxDecoration(
          //         color: Color(0xff242a54),
          //         borderRadius: BorderRadius.all(
          //           Radius.circular(30),
          //         ),
          //       ),
          //       child: Row(
          //         crossAxisAlignment: CrossAxisAlignment.center,
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Icon(
          //             Icons.add,
          //             color: Colors.white,
          //           ),
          //           SizedBox(
          //             width: 5,
          //           ),
          //           Text(
          //             "Apply",
          //             style: TextStyle(color: Colors.white),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}