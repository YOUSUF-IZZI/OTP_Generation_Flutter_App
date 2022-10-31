import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'LoginPage.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // code part
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.indigo
      ),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
