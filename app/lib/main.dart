import 'package:ArcGraph/models/evaluated/evalCompetence.dart';
import 'package:ArcGraph/models/evaluations/competence.dart';
import 'package:ArcGraph/models/evaluations/dimensionToEvaluate.dart';
import 'package:ArcGraph/models/evaluations/hability.dart';
import 'package:ArcGraph/widgets/graphs.dart';
import 'package:ArcGraph/widgets/student.dart';
import 'package:ArcGraph/widgets/subjects.dart';
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
  Map<String, int> featuresValues = new Map<String, int>();

  List<Widget> GetHabilitiesSliders(List<String> features, num featuresQT) {
    List<Widget> list = new List<Widget>();
    for (var i = 0; i < featuresQT; i++) {
      list.add(Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(features[i]),
            Expanded(
                child: Slider(
              value: featuresValues[features[i]].toDouble(),
              min: 0,
              max: 100,
              divisions: 1000,
              onChanged: (value) {
                setState(() {
                  featuresValues[features[i]] = value.floor();
                });
              },
            ))
          ],
        ),
      ));
    }
    return list;
  }

  Competence getCompentence() {
    return new Competence("Competencia1", <Hability>[
      Hability("Hability 1", <DimensionToEvaluate>[
        DimensionToEvaluate("Dimension1", 1),
        DimensionToEvaluate("Dimension2", 1),
        DimensionToEvaluate("Dimension3", 1),
      ]),
      Hability("Hability 2", <DimensionToEvaluate>[
        DimensionToEvaluate("Dimension1", 1),
        DimensionToEvaluate("Dimension2", 1),
        DimensionToEvaluate("Dimension3", 1),
      ]),
      Hability("Hability 3", <DimensionToEvaluate>[
        DimensionToEvaluate("Dimension1", 1),
        DimensionToEvaluate("Dimension2", 1),
        DimensionToEvaluate("Dimension3", 1),
      ]),
    ]);
  }

  void generateGrades() {
    var competence = Competence("Competencia1", <Hability>[
      Hability("Hability 1", <DimensionToEvaluate>[
        DimensionToEvaluate("Dimension1", 1),
        DimensionToEvaluate("Dimension2", 1),
        DimensionToEvaluate("Dimension3", 1),
      ]),
      Hability("Hability 2", <DimensionToEvaluate>[
        DimensionToEvaluate("Dimension1", 1),
        DimensionToEvaluate("Dimension2", 1),
        DimensionToEvaluate("Dimension3", 1),
      ]),
      Hability("Hability 3", <DimensionToEvaluate>[
        DimensionToEvaluate("Dimension1", 1),
        DimensionToEvaluate("Dimension2", 1),
        DimensionToEvaluate("Dimension3", 1),
      ]),
    ]);

    var evalCompetence = EvalCompetence(competence);

    var habilityGradesSum = 0.0;
    for (var hability in evalCompetence.evalHabilities) {
      var multipliedSum = 0.0;
      var divisorSum = 0.0;
      for (var dimension in hability.dimensions) {
        multipliedSum += dimension.grade * dimension.evalDimension.weight;
        divisorSum += dimension.evalDimension.weight;
      }
      var habilityGrade = multipliedSum / divisorSum;
      habilityGradesSum += habilityGrade;
    }

    var finalGrade = habilityGradesSum / evalCompetence.evalHabilities.length;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            content: Text("Nota final é " + finalGrade.toString()));
      },
    );
  }

  Widget build(BuildContext context) {
    var ticks = new List<int>();
    for (var i = 0; i < 101; i += 10) {
      ticks.add(i);
    }

    var features = ["A", "B", "C", "D", "E", "F", "G", "H"];
    for (var i = 0; i < numberOfFeatures; i++) {
      if (!featuresValues.containsKey(features[i]))
        featuresValues[features[i]] = 0;
    }

    var data = [
      [20, 18, 16, 11, 3, 19, 1, 13]
    ];

    features = features.sublist(0, numberOfFeatures.floor());

    data = [
      List<int>.from(featuresValues.values).sublist(0, numberOfFeatures.floor())
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Container(
                  child: Column(
                children: [
                  Align(
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.pink.shade800,
                      child: Text('N'),
                    ),
                    alignment: Alignment.topLeft,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text(
                        "Nome ",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text("email@ucs.br",
                          style: TextStyle(color: Colors.white))
                    ],
                  ),
                ],
              )),
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.input),
              title: Text("Login"),
              onTap: () {
                /*   Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NOMEDACLASSEDAOUTRAPAGINAASERACESSADA()));*/
              },
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: Text("Disciplinas"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => new Subjects(),
                  ),
                );
                //stuff
                //  Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.assignment),
              title: Text("Competências"),
              onTap: () {
                //stuff
                //   Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.assessment),
              title: Text("Habilidades"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Student()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.pie_chart),
              title: Text("Gráfico"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Graphs(competence: this.getCompentence())));
              },
            ),
          ],
        ),
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
                )
              ] +
              GetHabilitiesSliders(features, numberOfFeatures) +
              <Widget>[
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
                RaisedButton(
                  onPressed: () {
                    this.generateGrades();
                  },
                  child: const Text('Gerar Nota'),
                )
              ],
        ),
      ),
    );
  }
}
