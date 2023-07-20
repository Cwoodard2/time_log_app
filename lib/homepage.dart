import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key, required this.title});

  final String title;

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: NavigationBar(
        destinations: [
          NavigationDestination(
          icon: Icon(Icons.home), 
          label: "Home",
          ),
          NavigationDestination(
            icon: Icon(Icons.list), 
            label: "Activity Logger")
        ],
      ),
    ));
  }
}
