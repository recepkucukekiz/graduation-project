// ignore_for_file: prefer_const_constructors

import 'package:dukkansepeti/pages/booking_page.dart';
import 'package:flutter/material.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  late var width;

  bool isSelected = false;
  List<bool> selectedServiceToogleList = List.filled(6, false);
  List<bool> selectedWorkerToogleList = List.filled(6, false);
  String selectedService = '';
  String selectedWorker = '';

  Widget shopCardWidget(String name) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color.fromARGB(99, 255, 0, 0),
        // image: DecorationImage(
        //   image: NetworkImage(
        //       "https://i4.hurimg.com/i/hurriyet/75/750x422/63012c584e3fe1034048147a.jpg"),
        //   fit: BoxFit.cover,
        //   opacity: 0.9,
        // ),
      ),
      height: 180,
      width: width,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(),
          Text(
            name,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget itemBox(IconData icon, String text, int id, String type) {
    return InkWell(
      onTap: () {
        setState(() {
          if (type == "Services") {
            if (selectedServiceToogleList[id] == true) {
              selectedServiceToogleList[id] = false;
              selectedService = '';
            } else {
              selectedServiceToogleList = List.filled(6, false);
              selectedServiceToogleList[id] = true;
              selectedService = text;
            }
          } else {
            if (selectedWorkerToogleList[id] == true) {
              selectedWorkerToogleList[id] = false;
              selectedWorker = '';
            } else {
              selectedWorkerToogleList = List.filled(6, false);
              selectedWorkerToogleList[id] = true;
              selectedWorker = text;
            }
          }
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color.fromARGB(99, 255, 0, 0),
          border: type == "Services"
              ? Border.all(
                  color: selectedServiceToogleList[id]
                      ? Colors.black
                      : Colors.transparent,
                  width: 2,
                )
              : Border.all(
                  color: selectedWorkerToogleList[id]
                      ? Colors.black
                      : Colors.transparent,
                  width: 2,
                ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(icon),
            Text(text),
          ],
        ),
      ),
    );
  }

  Widget sectionWidget(String title, IconData icon, String text, List list) {
    List<Widget> childrenList = List<Widget>.empty(growable: true);
    for (var element in list) {
      childrenList.add(itemBox(icon, element, list.indexOf(element), title));
    }
    return Wrap(
      runSpacing: 12,
      children: [
        Text(title),
        SizedBox(
          height: 100.0,
          child: GridView(
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            children: childrenList,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Suha Berber",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Wrap(
              runSpacing: 28,
              children: [
                shopCardWidget("name"),
                Wrap(
                  direction: Axis.vertical,
                  spacing: 8,
                  children: const [
                    Text(
                      "Erkek Kuaförü",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("09:00-19:00"),
                    Text("+90 531 386 2766"),
                    Text(
                        "Beyazevler Mah. 80026 Sokak Tülay Çakiroglu Apt. No:5/3 Cukurova/Adana"),
                  ],
                ),
                sectionWidget("Services", Icons.cut, "service",
                    ["Saç", "Sakal", "Kuru Saç", "Kuru Sakal", "Bakım"]),
                sectionWidget("Workers", Icons.people, "worker",
                    ["Suha", "Ali", "Veli", "Ayşe", "Fatma"]),
                Center(
                  child: Text(selectedService == '' || selectedWorker == ''
                      ? "Please select a service and a worker"
                      : "You select $selectedService from $selectedWorker"),
                ),
                Center(
                  child: Container(
                    height: 40,
                    width: 180,
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
                          if (selectedServiceToogleList.contains(true) &&
                              selectedWorkerToogleList.contains(true)) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const BookingPage()),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: const Text(
                                  'Please select a service and worker'),
                              action: SnackBarAction(
                                label: 'OK',
                                onPressed: () {
                                  // Some code to undo the change.
                                },
                              ),
                            ));
                          }
                        },
                        child: const Text(
                          'Check available times',
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
