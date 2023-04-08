import 'dart:io';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:damasfollows/screens/bottomnavbar.dart';
import 'package:damasfollows/screens/homepage.dart';
import 'package:flutter/material.dart';

enum NetworkStatus { online, offline }

Future<void> main() async {
  var connectedornot = NetworkStatus.offline;
  try {
    final result = await InternetAddress.lookup('example.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      connectedornot = NetworkStatus.online;
    } else {
      connectedornot = NetworkStatus.offline;
    }
  } on SocketException catch (_) {
    connectedornot = NetworkStatus.offline;
  }
  runApp(MyApp(connectedornot: connectedornot,));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key, required this.connectedornot}) :super(key: key);
  final connectedornot;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DamasFollows',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: AnimatedSplashScreen(
        backgroundColor: Colors.black,
        duration: 3000,
        splashIconSize: 180,
        splash: "assets/logo.png",
        splashTransition: SplashTransition.fadeTransition,
        nextScreen: BottomNavBar(
          connectedornot: connectedornot,

        ),
      ),
    );
  }
}


