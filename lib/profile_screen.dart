import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text('ProfileScreen'),
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  context.go('/profile/detailProfile/1996', extra: 'Hi bro!!');
                },
                child: const Text('Detail ProfileScreen')),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  context.go('/profile/fileDownloadScreen');
                },
                child: const Text('Download File Screen')),
          )
        ],
      ),
    );
  }
}
