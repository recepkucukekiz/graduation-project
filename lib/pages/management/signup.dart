// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:dukkansepeti/pages/management/signup2.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  // Create controllers for the TextFields
  final companyNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Signup Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: companyNameController,
              decoration: InputDecoration(
                labelText: 'Company Name',
              ),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true, // hides the input text
            ),
            // DropdownButton<String>(
            //   items: [
            //     DropdownMenuItem(
            //       child: Text('City 1'),
            //       value: 'city1',
            //     ),
            //     DropdownMenuItem(
            //       child: Text('City 2'),
            //       value: 'city2',
            //     ),
            //   ],
            //   onChanged: (String? value) {
            //     // Handle the change for the selected city
            //   },
            // ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Signup2()));
              },
              child: Text('Signup'),
            ),
          ],
        ),
      ),
    );
  }
}
