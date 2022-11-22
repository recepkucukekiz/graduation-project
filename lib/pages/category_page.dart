import 'package:dukkansepeti/pages/shop_page.dart';
import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors

class CategoryPage extends StatefulWidget {
  CategoryPage({super.key, required this.title});
  String title;
  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  late var width;

  Widget shopCard(String name) {
    return InkWell(
      onTap: (() => {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ShopPage()),
            )
          }),
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromARGB(100, 146, 146, 146),
          // image: DecorationImage(
          //   image: NetworkImage(
          //       "https://i4.hurimg.com/i/hurriyet/75/750x422/63012c584e3fe1034048147a.jpg"),
          //   fit: BoxFit.cover,
          //   opacity: 0.9,
          // ),
        ),
        height: 180,
        width: width,
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Spacer(),
                Column(
                  children: const [Text("09:00 - 18:00"), Text("Seyhan/Adana")],
                )
              ],
            ),
            Spacer(),
            Text(
              "Süha Berber",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text("Erkek Kuaförü"),
            Wrap(
              spacing: 10,
              children: const [
                Text("Saç"),
                Text("Sakal"),
                Text("Masaj"),
                Text("Maske"),
                Text("Manikür"),
                Text("Pedikür"),
              ],
            )
          ],
        ),
      ),
    );
  }

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
            shopCard("ABC"),
            shopCard("ABC"),
            shopCard("ABC"),
            shopCard("ABC"),
            shopCard("ABC"),
            shopCard("ABC"),
            shopCard("ABC"),
            shopCard("ABC"),
          ],
        ),
      )),
    );
  }
}
