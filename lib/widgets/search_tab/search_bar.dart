import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate<String> {
  final List keywords = [
    "Android development",
    "Web development",
    "Graphic designing",
    "Entrepreneurship",
    "Startup mentors",
    "Dance",
    "Art and craft",
  ];
  final List recentKeywords = [
    "Entrepreneurship",
    "Startup mentors",
    "Android development",
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Center(
      child: Container(
        height: 100,
        width: 100,
        color: Colors.orange,
      ),
    );
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    final suggestionList = query.isEmpty
        ? recentKeywords
        : keywords.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        leading: Icon(
          Icons.arrow_right_rounded,
        ),
        title: RichText(
          text: TextSpan(
            text: suggestionList[index].substring(0, query.length),
            style: TextStyle(
              fontFamily: "ProductSans",
              // fontWeight: FontWeight.w500,
              color: Color(0xff242a54),
              fontSize: 17,
            ),
            children: [
              TextSpan(
                text: suggestionList[index].substring(query.length),
                style: TextStyle(
                  fontFamily: "ProductSans",
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                  fontSize: 17,
                ),
              ),
            ],
          ),
        ),
      ),
      itemCount: suggestionList.length,
    );
    throw UnimplementedError();
  }
}
