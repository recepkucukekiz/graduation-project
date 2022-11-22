import 'package:dukkansepeti/pages/category_page.dart';
import 'package:flutter/material.dart';
import 'package:outline_search_bar/outline_search_bar.dart';

class StartupPage extends StatefulWidget {
  const StartupPage({super.key});

  @override
  State<StartupPage> createState() => _StartupPageState();
}

class _StartupPageState extends State<StartupPage> {
  Widget bottomGridView(BuildContext context, double height, String page) {
    return SizedBox(
      height: height,
      child: GridView.count(
        scrollDirection: Axis.horizontal,
        crossAxisCount: 2,
        childAspectRatio: (1 / 2),
        children: List.generate(4, (index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CategoryPage(title: page)),
              );
            },
            child: const Card(
              color: Colors.white12,
              child: Center(
                child: Text("berber"),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget searcBox(TextEditingController textController) {
    return OutlineSearchBar(
      textEditingController: textController,
      hintText: "Search anything..",
      borderColor: Colors.blueAccent,
      borderRadius: BorderRadius.circular(25),
      searchButtonIconColor: Colors.blueAccent,
      onSearchButtonPressed: (value) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(value),
        ));
      },
    );
  }

  Widget topView(double width, double height) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromARGB(100, 146, 146, 146),
      ),
      height: height,
      width: width,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Spacer(),
          Text(
            "Good Evening",
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.of(context).size.height - (MediaQuery.of(context).padding.top + kToolbarHeight);
    var height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double spaceSize = 12;

    TextEditingController searchboxText = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                topView(width, height - 200 - 90 - 2 * spaceSize),
                SizedBox(
                  height: spaceSize,
                ),
                searcBox(searchboxText),
                SizedBox(
                  height: spaceSize,
                ),
                bottomGridView(context, 200, "Berber"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
