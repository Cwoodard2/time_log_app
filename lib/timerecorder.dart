import 'package:flutter/material.dart';
import './activities.dart';
import 'dart:async';

class TimeRecorderPage extends StatefulWidget {
  const TimeRecorderPage({super.key, required this.title});

  final String title;

  @override
  State<TimeRecorderPage> createState() => _TimeRecorderPageState();
}

class _TimeRecorderPageState extends State<TimeRecorderPage> {
  final Stopwatch _stopwatch = Stopwatch();

  late Timer _timer;

  // The result which will be displayed on the screen
  String _result = '00:00:00';
  var _recordedTimes = [];

  // This function will be called when the user presses the Start button
  void _start() {
    // Timer.periodic() will call the callback function every 100 milliseconds
    _timer = Timer.periodic(const Duration(milliseconds: 30), (Timer t) {
      // Update the UI
      setState(() {
        // result in hh:mm:ss format
        _result =
            '${_stopwatch.elapsed.inMinutes.toString().padLeft(2, '0')}:${(_stopwatch.elapsed.inSeconds % 60).toString().padLeft(2, '0')}';
      });
    });
    // Start the stopwatch
    _stopwatch.start();
  }

  // This function will be called when the user presses the Stop button
  void _stop() {
    _timer.cancel();
    _stopwatch.stop();
  }

  // This function will be called when the user presses the Reset button
  void _reset() {
    _stop();
    _stopwatch.reset();
    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);

    // Update the UI
    setState(() {
      _recordedTimes.add({
        'duration': _result,
        'activity': "Test Activity",
        'date': date,
        'description': "This is a description",
        'pay': "This is the pay"
      });
      _result = "00:00";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Current Time:',
            ),
            Text(
              _result,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              ElevatedButton(onPressed: _start, child: Text("Start")),
              ElevatedButton(onPressed: _reset, child: Text("Stop"))
            ]),
            Column(children: [
              for (var item in _recordedTimes)
                SizedBox(
                  width: 500,
                  height: 75,
                  child: RecordedActivity(item: item),
                )
            ]),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
