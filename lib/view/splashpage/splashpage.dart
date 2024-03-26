
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:noteapp/view/note_home/note_home.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(Duration(seconds: 4), () {
      Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context)=>NoteHome()));
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Lottie.asset("assets/animations/Animation - 1707906512722.json")
      ),
    );
  }
}
