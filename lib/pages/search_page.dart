import 'package:flutter/material.dart';
import '../components/searchBox_component.dart';
import '../components/shopCard_component.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key, required this.query});

  final String query;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late var width;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: searcBox(context, widget.query),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            shopCard(context, width, "ABC"),
            shopCard(context, width, "ABC"),
            shopCard(context, width, "ABC"),
            shopCard(context, width, "ABC"),
            shopCard(context, width, "ABC"),
            shopCard(context, width, "ABC"),
            shopCard(context, width, "ABC"),
            shopCard(context, width, "ABC"),
          ],
        ),
      )),
    );
  }
}
