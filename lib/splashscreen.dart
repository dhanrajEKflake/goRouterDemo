import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTimer() async {
    Future.delayed(const Duration(seconds: 3), () {
      context.go('/home');
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.bottomCenter, colors: [
          Colors.redAccent.shade100,
          Colors.redAccent.shade700,
          Colors.redAccent.shade700,
          Colors.redAccent.shade100,
          Colors.redAccent.shade400,
          Colors.redAccent.shade200,
          Colors.redAccent.shade700,
        ])),
        child: const Center(
          child: Text(
            'SplashScreen',
            style: TextStyle(
                fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
