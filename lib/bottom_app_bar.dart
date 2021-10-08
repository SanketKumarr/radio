import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:radio_lnct/BottomNavigationBar/home_tab.dart';
import 'package:radio_lnct/BottomNavigationBar/live_tab.dart';
import 'package:radio_lnct/BottomNavigationBar/searchTab.dart';
import 'package:radio_lnct/BottomNavigationBar/user_profile_tab.dart';

import 'BottomNavigationBar/news_tab.dart';

int currentIndex = 0;
final List<Widget> tabs = [
  const HomeTab(),
  const SearchTab(),
  // LiveTab(),
  const NewsTab(),
  const UserProfileTab(),
];

final PageStorageBucket bucket = PageStorageBucket();
Widget currentScreen = const HomeTab();

class Structure extends StatefulWidget {
  const Structure({Key? key}) : super(key: key);

  @override
  _StructureState createState() => _StructureState();
}

class _StructureState extends State<Structure> {
  // int _currentIndex = 0;
  // final List<Widget> tabs = [
  //   HomeTab(),
  //   SearchTab(),
  //   // LiveTab(),
  //   NewsTab(),
  //   ProfileTab(),
  // ];
  //
  // final PageStorageBucket bucket = PageStorageBucket();
  // Widget currentScreen = HomeTab();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            currentScreen = LiveTab();
            currentIndex = 3;
          });
        },
        child: const Padding(
          padding: EdgeInsets.only(right: 0, left: 1),
          child: Icon(
            Icons.airplay,
            color: Colors.orange,
            size: 30,
          ),
        ),
        backgroundColor: const Color(0xff242a54),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 30.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          child: BottomAppBar(
            color: const Color(0xff242a54),
            shape: const CircularNotchedRectangle(),
            notchMargin: 7,
            child: Container(
              height: 55,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //cmnt: -------------LEFT SIDE ICONS--------------------------
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: MaterialButton(
                          onPressed: () {
                            setState(() {
                              currentScreen = const HomeTab();
                              currentIndex = 0;
                            });
                          },
                          child: Icon(
                            Icons.home,
                            color: currentIndex == 0
                                ? Colors.white
                                : Colors.grey[600],
                          ),
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          // color: Colors.yellow,
                          minWidth: 10,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: MaterialButton(
                          onPressed: () {
                            setState(() {
                              currentScreen = const SearchTab();
                              currentIndex = 1;
                            });
                          },
                          child: Icon(
                            CupertinoIcons.search,
                            color: currentIndex == 1
                                ? Colors.white
                                : Colors.grey[600],
                          ),
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          // color: Colors.yellow,
                          minWidth: 10,
                        ),
                      ),
                    ],
                  ),
                  //cmnt: -------------RIGHT SIDE ICONS-------------------------
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: MaterialButton(
                          onPressed: () {
                            setState(() {
                              currentScreen = const NewsTab();
                              currentIndex = 4;
                            });
                          },
                          child: Icon(
                            CupertinoIcons.news,
                            color: currentIndex == 4
                                ? Colors.white
                                : Colors.grey[600],
                          ),
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          // color: Colors.yellow,
                          minWidth: 10,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: MaterialButton(
                          onPressed: () {
                            setState(() {
                              currentScreen = const UserProfileTab();
                              currentIndex = 5;
                            });
                          },
                          child: Icon(
                            CupertinoIcons.profile_circled,
                            color: currentIndex == 5
                                ? Colors.white
                                : Colors.grey[600],
                          ),
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          // color: Colors.yellow,
                          minWidth: 10,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
