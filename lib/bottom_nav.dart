import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key, required this.statefulNavigationShell});

  final StatefulNavigationShell statefulNavigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: statefulNavigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: statefulNavigationShell.currentIndex,
        onTap: (value) {
          statefulNavigationShell.goBranch(value,
              initialLocation: value == statefulNavigationShell.currentIndex);
        },
        items: const [
          BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home_filled)),
          BottomNavigationBarItem(
              label: 'Profile',
              icon: Icon(Icons.person_2_outlined),
              activeIcon: Icon(Icons.person))
        ],
      ),
    );
  }
}
