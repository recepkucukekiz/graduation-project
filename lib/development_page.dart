import 'package:dukkansepeti/pages/booking_page.dart';
import 'package:dukkansepeti/pages/booking_result_page.dart';
import 'package:dukkansepeti/pages/category_page.dart';
import 'package:dukkansepeti/pages/management/login.dart';
import 'package:dukkansepeti/pages/management/resourceView.dart';
import 'package:dukkansepeti/pages/management/selection_page.dart';
import 'package:dukkansepeti/pages/search_page.dart';
import 'package:dukkansepeti/pages/shop_page.dart';
import 'package:dukkansepeti/pages/startup_page.dart';
import 'package:flutter/material.dart';

class DevelopmentPage extends StatelessWidget {
  const DevelopmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).padding.top + kToolbarHeight);

    final snackBar = SnackBar(
      content: const Text('Yay! A SnackBar!'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );

    return Scaffold(
        appBar: AppBar(
          title: const Text('Development Pages'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height,
                child: GridView.count(
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.all(12),
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    crossAxisCount: 2,
                    childAspectRatio: (1 / 1),
                    children: [
                      // ElevatedButton(
                      //   child: const Text('Snackbar'),
                      //   onPressed: () {
                      //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      //     // Navigator.push(
                      //     //   context,
                      //     //   MaterialPageRoute(
                      //     //       builder: (context) => BookingCalendarDemoApp(
                      //     //             msg: "annee",
                      //     //           )),
                      //     // );
                      //   },
                      // ),
                      // ElevatedButton(
                      //     onPressed: () {
                      //       showModalBottomSheet(
                      //           context: context,
                      //           builder: (context) {
                      //             return Column(
                      //               mainAxisSize: MainAxisSize.min,
                      //               children: <Widget>[
                      //                 const Text("abc"),
                      //                 ListTile(
                      //                   leading: new Icon(Icons.photo),
                      //                   title: new Text('Photo'),
                      //                   onTap: () {
                      //                     Navigator.pop(context);
                      //                   },
                      //                 ),
                      //                 ListTile(
                      //                   leading: new Icon(Icons.music_note),
                      //                   title: new Text('Music'),
                      //                   onTap: () {
                      //                     Navigator.pop(context);
                      //                   },
                      //                 ),
                      //                 ListTile(
                      //                   leading: new Icon(Icons.videocam),
                      //                   title: new Text('Video'),
                      //                   onTap: () {
                      //                     Navigator.pop(context);
                      //                   },
                      //                 ),
                      //                 ListTile(
                      //                   leading: new Icon(Icons.share),
                      //                   title: new Text('Share'),
                      //                   onTap: () {
                      //                     Navigator.pop(context);
                      //                   },
                      //                 ),
                      //               ],
                      //             );
                      //           });
                      //     },
                      //     child: const Text("Bottom sheet")),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const StartupPage()),
                            );
                          },
                          child: const Text("Startup Page")),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CategoryPage(
                                        title: "Güzellik Salonu",
                                      )),
                            );
                          },
                          child: const Text("Category Page")),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SearchPage(
                                        query: "test query",
                                      )),
                            );
                          },
                          child: const Text("Search Page")),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ShopPage()),
                            );
                          },
                          child: const Text("Shop Page")),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const BookingPage()),
                            );
                          },
                          child: const Text("Booking Page")),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ResultPage()),
                            );
                          },
                          child: const Text("Booking Result Page")),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                          child: const Text("Login Page")),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ResourceView()));
                          },
                          child: const Text("ResourceView Page")),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SelectionPage()));
                          },
                          child: const Text("Selection Page")),
                    ]),
              )
            ],
          ),
        ));
  }
}
