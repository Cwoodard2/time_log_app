import 'package:flutter/material.dart';

class RecordedActivity extends StatelessWidget {
  const RecordedActivity({super.key, required this.item});

  final Map item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(children: [
        Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(10)),
            margin: EdgeInsets.only(bottom: 10.0, top: 10.0),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(children: [
                      Text(item['activity']),
                    ]),
                    Column(children: [
                      Text(item['description']),
                    ]),
                    Column(children: [
                      Text(item['duration']),
                      Text(item['pay']),
                    ])
                  ]),
            ))
      ])),
    );
  }
}