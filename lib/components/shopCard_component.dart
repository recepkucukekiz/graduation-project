import 'package:flutter/material.dart';
import '../pages/shop_page.dart';

Widget shopCard(BuildContext context, double width, String name) {
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
