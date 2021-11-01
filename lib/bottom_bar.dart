import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ionicons/ionicons.dart';
import 'package:radio_lnct/BottomNavigationBar/home_tab.dart';
import 'package:radio_lnct/BottomNavigationBar/live_tab.dart';
import 'package:radio_lnct/BottomNavigationBar/user_profile_tab.dart';
import 'package:radio_lnct/main.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _index = 0;

  // padding for active color box:-
  var padding = EdgeInsets.symmetric(horizontal: 15, vertical: 15);
  double gap = 10;

  List tabs = [
    HomeTab(),
    LiveTab(),
    UserProfileTab(),
  ];
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView.builder(
        scrollBehavior: MyBehaviour(),
        itemCount: 3,
        controller: controller,
        onPageChanged: (page) {
          setState(() {
            _index = page;
          });
        },
        itemBuilder: (context, position) {
          return Container(
            child: tabs[position],
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
        child: Container(
          height: 59,
          width: MediaQuery.of(context).size.width,
          // margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
            color: Color(0xff242a54),
            borderRadius: BorderRadius.all(Radius.circular(30))
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
            child: GNav(
              tabs: [
                GButton(
                  icon: Ionicons.home_outline,
                  iconColor: Colors.grey,
                  iconActiveColor: Color(0xff242a54),
                  text: "Home",
                  textStyle: TextStyle(
                    color: Color(0xff242a54),
                    fontFamily: "ProductSans",
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                  backgroundColor: Colors.white,
                  iconSize: 25,
                  padding: padding,
                  gap: gap,
                ),
                GButton(
                  icon: Ionicons.mic,
                  iconColor: Colors.grey,
                  iconActiveColor: Color(0xff242a54),
                  text: "Interview",
                  textStyle: TextStyle(
                    color: Color(0xff242a54),
                    fontFamily: "ProductSans",
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                  backgroundColor: Colors.white,
                  iconSize: 24,
                  padding: padding,
                  gap: gap,
                ),
                GButton(
                  icon: Ionicons.person_outline,
                  iconColor: Colors.grey,
                  iconActiveColor: Color(0xff242a54),
                  text: "Profile",
                  textStyle: TextStyle(
                    color: Color(0xff242a54),
                    fontFamily: "ProductSans",
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                  backgroundColor: Colors.white,
                  iconSize: 24,
                  padding: padding,
                  gap: gap,
                ),
              ],
              selectedIndex: _index,
              onTabChange: (index) {
                setState(() {
                  _index = index;
                });
                controller.jumpToPage(index);
              },
              curve: Curves.fastOutSlowIn,
              duration: Duration(milliseconds: 400),
            ),
          ),
        ),
      ),
    );
  }
}
