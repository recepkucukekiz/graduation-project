import 'package:flutter/material.dart';
import 'package:outline_search_bar/outline_search_bar.dart';
import '../pages/search_page.dart';

Widget searcBox(BuildContext context, String query) {
  return OutlineSearchBar(
    initText: query,
    hintText: "Search anything..",
    borderColor: const Color.fromRGBO(255, 188, 143, 1),
    borderRadius: BorderRadius.circular(25),
    searchButtonIconColor: const Color.fromRGBO(255, 143, 158, 1),
    onSearchButtonPressed: (value) {
      if (value != "") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SearchPage(query: value)),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Please enter a search query"),
        ));
      }
    },
  );
}
