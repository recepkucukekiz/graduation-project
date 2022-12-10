// ignore_for_file: prefer_const_constructors

import 'package:dukkansepeti/pages/management/signup3.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Signup2 extends StatefulWidget {
  const Signup2({super.key});

  @override
  State<Signup2> createState() => _Signup2State();
}

class _Signup2State extends State<Signup2> {
  final workerNameController = TextEditingController();

  var workers = [
    "Recep",
    "Ali",
  ];

  showDeleteAlert(String e) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  20.0,
                ),
              ),
            ),
            contentPadding: EdgeInsets.only(
              top: 10.0,
            ),
            title: Text(
              "Delete Worker",
              style: TextStyle(fontSize: 16.0),
            ),
            content: Container(
              height: 200,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Are you sure about it?",
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 60,
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            workers.remove(e);
                          });
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "Delete",
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 60,
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "No",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget test() {
    return SizedBox(
      height: 200,
      child: ListView(
        children: workers.map((e) {
          return ListTile(
            title: Text(e),
            onTap: () {
              showDeleteAlert(e);
            },
          );
        }).toList(),
      ),
    );
  }

  showDataAlert() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  20.0,
                ),
              ),
            ),
            contentPadding: EdgeInsets.only(
              top: 10.0,
            ),
            title: Text(
              "Add Worker",
              style: TextStyle(fontSize: 24.0),
            ),
            content: Container(
              height: 200,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Worker Name",
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: workerNameController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter name here',
                            labelText: 'Name'),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 60,
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            workers.add(workerNameController.text);
                            workerNameController.text = "";
                          });
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "Submit",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Baslık"),
        ElevatedButton(
          onPressed: () {
            showDataAlert();
          },
          child: Text("Ekle"),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Signup Step 2 Page'),
        ),
        body: SafeArea(
            child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: header(),
            ),
            Expanded(
              flex: 6,
              child: test(),
            ),
            Expanded(
              flex: 1,
              child: header(),
            ),
            Expanded(
              flex: 6,
              child: test(),
            ),
            Expanded(
              flex: 1,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Signup3()),
                  );
                },
                child: Text("Kayıt Ol"),
              ),
            ),
          ],
        )
            //   Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: <Widget>[
            //       SizedBox(
            //         height: 200,
            //         child: ListView(
            //           children: [
            //             ListTile(
            //               title: Text("Yeter Ki Sonu İyi Bitsin "),
            //             ),
            //             ListTile(
            //               title: Text("Gurur ve Önyargı"),
            //             ),
            //             ListTile(
            //               title: Text("Milena'ya Mektuplar"),
            //             )
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            ));
  }
}
