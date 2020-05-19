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
  double numberOfFeatures = 3;

  Widget build(BuildContext context) {
    const ticks = [
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      10,
      11,
      12,
      13,
      14,
      15,
      16,
      17,
      18,
      19,
      20
    ];
    var features = ["A", "B", "C", "D", "E", "F", "G", "H"];
    var data = [
      [20, 18, 16, 11, 3, 19, 1, 13]
    ];

    features = features.sublist(0, numberOfFeatures.floor());
    data = data
        .map((graph) => graph.sublist(0, numberOfFeatures.floor()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text('Número de habilidades'),
                  Expanded(
                      child: Slider(
                    value: this.numberOfFeatures,
                    min: 3,
                    max: 8,
                    divisions: 5,
                    onChanged: (value) {
                      setState(() {
                        numberOfFeatures = value;
                      });
                    },
                  ))
                ],
              ),
            ),
            Expanded(
              child: RadarChart(
                ticksTextStyle: TextStyle(
                  fontSize: 0,
                ),
                outlineColor: Colors.black,
                axisColor: Color.fromRGBO(0, 0, 0, 200),
                ticks: ticks,
                features: features,
                data: data,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
