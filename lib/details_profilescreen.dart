import 'package:flutter/material.dart';

class DetailProfileScreen extends StatelessWidget {
  const DetailProfileScreen({super.key, this.paramData, this.extra});
  final String? paramData;
  final Object? extra;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Details'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              extra.toString(),
              style: const TextStyle(fontSize: 28),
            ),
          ),
          Center(
            child: Text(paramData ?? 'Empty'),
          ),
        ],
      ),
    );
  }
}
