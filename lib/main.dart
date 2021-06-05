import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oto_mudiak/provider/bus_provider.dart';
import 'package:oto_mudiak/ui/pages/pages.dart';
import 'package:provider/provider.dart';

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
    return ChangeNotifierProvider(
      create: (context) => BusProvider(),
      child: GetMaterialApp(
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
