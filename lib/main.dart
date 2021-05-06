import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oto_mudiak/ui/pages/pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MainPage(),
      ),
    );
  }
}
