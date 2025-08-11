import 'package:flutter/material.dart';

import '../Theme/my_theme.dart';
import 'Search/Cubit/search_view.dart';

class SearchScreen extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          showResults(context);
        },
        icon: Icon(Icons.search),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: Icon(Icons.close),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildSuggestions(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container(
        child: Center(child: Image.asset('assets/images/Group 22.png')),
      );
    }

    // لو عايز تاخد كامل المساحة بتاعت الشاشة، تستخدم SizedBox.expand
    return SizedBox.expand(
      child: SearchView(query: query),
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return MyTheme.PrimaryTheme;
  }
}
