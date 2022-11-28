import 'package:flutter/material.dart';
import '../components/shopCard_component.dart';
// ignore_for_file: prefer_const_constructors

class CategoryPage extends StatefulWidget {
  CategoryPage({super.key, required this.title});
  String title;
  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  late var width;

  Widget topGridView(BuildContext context, double height) {
    return SizedBox(
      height: height,
      child: GridView.count(
        scrollDirection: Axis.horizontal,
        crossAxisCount: 1,
        childAspectRatio: (1 / 2),
        children: List.generate(6, (index) {
          return InkWell(
            onTap: () {
              setState(() {
                widget.title = "abc";
              });
            },
            child: const Card(
              color: Color.fromARGB(98, 255, 0, 0),
              child: Center(
                child: Text("berber"),
              ),
            ),
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            topGridView(context, 50),
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
