import 'package:flutter/material.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ArcGraph',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'ArcGraph'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    const ticks = [1, 2, 3, 4, 5, 6, 7];
    var features = ["A", "B", "C", "D", "E"];
    var data = [
      [4, 4, 4, 4, 4, 7],
      [4, 1, 4, 4, 4, 7],
      [4, 4, 3, 4, 4, 7],
      [4, 7, 4, 4, 4, 7],
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: RadarChart.light(
          ticks: ticks,
          features: features,
          data: data,
        ),
      ),
    );
  }
}
