import 'package:flutter/material.dart';
import 'package:radio_lnct/widgets/search_tab/search_bar.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 35, left: 15),
              child: Text(
                "Search",
                style: TextStyle(
                  fontFamily: "ProductSans",
                  color: Color(0xff242a54),
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 50, right: 15),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 45,
                decoration: BoxDecoration(
                  // color: Colors.red,
                  border: Border.all(
                    color: Colors.orange,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Transform.translate(
                  offset: Offset(0, -6),
                  child: ListTile(
                    title: Text(
                      "Search...",
                      style: TextStyle(
                        fontFamily: "ProductSans",
                        fontWeight: FontWeight.w200,
                        color: Color(0xff242a54),
                      ),
                    ),
                    trailing: Icon(
                      Icons.search,
                      color: Color(0xff242a54),
                    ),
                    onTap: () {
                      showSearch(
                        context: context,
                        delegate: DataSearch(),
                      );
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 200),
              child: Opacity(
                opacity: 0.6,
                child: Image.asset(
                  "assets/illustrations/search_2.jpg",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
