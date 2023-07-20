import 'package:flutter/material.dart';
import './timerecorder.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key, required this.title});

  final String title;

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = SizedBox(width: 500, height: 500, child: TheHomepage());
        break;
      case 1:
        page = SizedBox(width: 500, height: 500, child: TimeRecorderPage(title: 'Time recorder'));
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }
    return Scaffold(
        body: Column(
      children: [
        NavigationBar(
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            NavigationDestination(
                icon: Icon(Icons.list), label: "Activity Logger")
          ],
          selectedIndex: selectedIndex,
          onDestinationSelected: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
        ),
        Container(
          child: page,
        )
      ],
    ));
  }
}

class TheHomepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("this is the homepage");
  }
}
