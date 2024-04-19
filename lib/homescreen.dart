import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text('HomeScreen'),
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  context.go('/home/homeDetails');
                },
                child: const Text('Detail Homescreen')),
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  context.go('/home/simpleAnimation');
                },
                child: const Text('Animation screen')),
          ),
        ],
      ),
    );
  }
}
