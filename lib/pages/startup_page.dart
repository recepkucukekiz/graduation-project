import 'package:dukkansepeti/pages/category_page.dart';
import 'package:dukkansepeti/pages/management/selection_page.dart';
import 'package:dukkansepeti/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:outline_search_bar/outline_search_bar.dart';

class StartupPage extends StatefulWidget {
  const StartupPage({super.key});

  @override
  State<StartupPage> createState() => _StartupPageState();
}

class _StartupPageState extends State<StartupPage> {
  Widget bottomGridView(BuildContext context, double height, String page) {
    List<String> categories = [
      "Bakery",
      "Butcher",
      "Dairy",
      "Fruit & Veg",
      "Grocery",
      "Meat",
      "Seafood",
      "Vegetables",
    ];
    return SizedBox(
      height: height,
      child: GridView.count(
        scrollDirection: Axis.horizontal,
        crossAxisCount: 2,
        childAspectRatio: (1 / 2),
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        children: List.generate(6, (index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        CategoryPage(title: categories[index])),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: const LinearGradient(
                  colors: [
                    Color.fromRGBO(255, 143, 158, 1),
                    Color.fromRGBO(255, 188, 143, 1),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.pink.withOpacity(0.2),
                //     spreadRadius: 4,
                //     blurRadius: 10,
                //     offset: const Offset(0, 3),
                //   )
                // ],
                // color: Color.fromARGB(150, 146, 146, 146),
              ),
              // color: Color.fromARGB(31, 253, 0, 0),
              child: Center(
                child: Text(categories[index]),
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

  Widget topView(double width, double height) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: const LinearGradient(
          colors: [
            Color.fromRGBO(255, 143, 158, 1),
            Color.fromRGBO(255, 188, 143, 1),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.pink.withOpacity(0.2),
            spreadRadius: 4,
            blurRadius: 10,
            offset: const Offset(0, 3),
          )
        ],
        // color: Color.fromARGB(150, 146, 146, 146),
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
                topView(
                    width,
                    height -
                        (200 + 90 + 40) -
                        3 * spaceSize), // 200=bottomGridView, 90=searcBox, 2*spaceSize=space, 40=button
                SizedBox(
                  height: spaceSize,
                ),
                searcBox(searchboxText),
                SizedBox(
                  height: spaceSize,
                ),
                bottomGridView(context, 200, "Berber"),
                SizedBox(
                  height: spaceSize,
                ),
                Container(
                  height: 40,
                  width: 280,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromRGBO(255, 143, 158, 1),
                          Color.fromRGBO(255, 188, 143, 1),
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(25.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.pink.withOpacity(0.2),
                          spreadRadius: 4,
                          blurRadius: 10,
                          offset: const Offset(0, 3),
                        )
                      ]),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SelectionPage()));
                      },
                      child: const Text(
                        'Are you worker or owner of a shop?',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: "Netflix",
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
