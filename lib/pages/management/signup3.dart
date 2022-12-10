// ignore_for_file: prefer_const_constructors

import 'package:dukkansepeti/development_page.dart';
import 'package:dukkansepeti/pages/management/login.dart';
import 'package:flutter/material.dart';
import 'package:time_range_picker/time_range_picker.dart';

class Signup3 extends StatefulWidget {
  const Signup3({super.key});

  @override
  State<Signup3> createState() => _Signup3State();
}

class _Signup3State extends State<Signup3> {
  var cities = [
    "Adana",
    "Adiyaman",
    "Afyon",
    "Agri",
    "Aksaray",
    "Amasya",
    "Ankara",
    "Antalya",
    "Ardahan",
    "Artvin",
    "Aydin",
    "Balikesir",
    "Bartin",
    "Batman",
    "Bayburt",
    "Bilecik",
    "Bingol",
    "Bitlis",
    "Bolu",
    "Burdur",
    "Bursa",
    "Canakkale",
    "Cankiri",
    "Corum",
    "Denizli",
    "Diyarbakir",
    "Duzce",
    "Edirne",
    "Elazig",
    "Erzincan",
    "Erzurum",
    "Eskisehir",
    "Gaziantep",
    "Giresun",
    "Gumushane",
    "Hakkari",
    "Hatay",
    "Igdir",
    "Isparta",
    "Istanbul",
    "Izmir",
    "Kahramanmaras",
    "Karabuk",
    "Karaman",
    "Kars",
    "Kastamonu",
    "Kayseri",
    "Kilis",
    "Kirikkale",
    "Kirklareli",
    "Kirsehir",
    "Kocaeli",
    "Konya",
    "Kutahya",
    "Malatya",
    "Manisa",
    "Mardin",
    "Mersin",
    "Mugla",
    "Mus",
    "Nevsehir",
    "Nigde",
    "Ordu",
    "Osmaniye",
    "Rize",
    "Sakarya",
    "Samsun",
    "Sanliurfa",
    "Siirt",
    "Sinop",
    "Sirnak",
    "Sivas",
    "Tekirdag",
    "Tokat",
    "Trabzon",
    "Tunceli",
    "Usak",
    "Van",
    "Yalova",
    "Yozgat",
    "Zonguldak"
  ];
  String selectedCity = 'Adana';

  TextEditingController phoneNumber = TextEditingController();
  TextEditingController adress = TextEditingController();
  TextEditingController workingHours = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Login Signup Page'),
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            TextField(
              controller: phoneNumber,
              decoration: InputDecoration(
                hintText: 'Phone Number',
              ),
            ),
            TextField(
              controller: adress,
              decoration: InputDecoration(
                hintText: 'Adress',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                TimeRange result = await showTimeRangePicker(
                  context: context,
                );
                setState(() {
                  workingHours.text = result.toString();
                });
              },
              child: Text("Select Working Hours"),
            ),
            DropdownButton(
              // Initial Value
              value: selectedCity,

              items: cities.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),

              onChanged: (String? value) {
                setState(() {
                  selectedCity = value!;
                });
                print(selectedCity);
              },
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => DevelopmentPage()),
                  (Route<dynamic> route) => false,
                );
              },
              child: Text('Login'),
            ),
          ],
        ),
      )),
    );
  }
}
