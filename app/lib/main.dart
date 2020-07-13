import 'package:ArcGraph/models/evaluated/evalCompetence.dart';
import 'package:ArcGraph/models/evaluations/competence.dart';
import 'package:ArcGraph/models/evaluations/dimensionToEvaluate.dart';
import 'package:ArcGraph/models/evaluations/hability.dart';
import 'package:ArcGraph/models/subject.dart';
import 'package:ArcGraph/widgets/graphs.dart';
import 'package:ArcGraph/widgets/student.dart';
import 'package:ArcGraph/widgets/subjects.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final subjects = List<Subject>();
  final defaultHabilities = [
    new Hability(
      "H1",
      [
        new DimensionToEvaluate("D1", .4),
        new DimensionToEvaluate("D2", .4),
        new DimensionToEvaluate("D3", .2),
      ],
    ),
    new Hability(
      "H2",
      [
        new DimensionToEvaluate("D1", .5),
        new DimensionToEvaluate("D2", .5),
      ],
    ),
    new Hability(
      "H3",
      [
        new DimensionToEvaluate("D1", .2),
        new DimensionToEvaluate("D2", .2),
        new DimensionToEvaluate("D3", .2),
        new DimensionToEvaluate("D4", .2),
        new DimensionToEvaluate("D5", .2),
      ],
    ),
  ];

  void addNewSubject(Subject subject) {
    subjects.clear();
    subjects.add(subject);
  }

  TextStyle titleStyle =
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue);
  TextStyle descriptionStyle =
      TextStyle(fontSize: 12, fontStyle: FontStyle.italic, color: Colors.black);

  Card tappableCard(String title, String description, Function tapFunction) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: InkWell(
        splashColor: Theme.of(context).accentColor.withAlpha(30),
        onTap: () {
          tapFunction();
        },
        child: Container(
          padding: EdgeInsets.all(20),
          width: 300,
          height: 100,
          child: Column(
            children: [
              Row(
                children: [
                  RichText(
                    text: TextSpan(
                      text: title,
                      style: titleStyle,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  RichText(
                    text: TextSpan(
                      text: description,
                      style: descriptionStyle,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    builder: (context) => new Subjects(addNewSubject),
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Student(
                              this.subjects.isEmpty
                                  ? defaultHabilities
                                  : this
                                      .subjects
                                      .first
                                      .competences
                                      .first
                                      .habilities,
                            )));
              },
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            floating: false,
            snap: false,
            expandedHeight: 150.0,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text('Arc Graph'),
            ),
            actions: <Widget>[
              /*IconButton(
                  icon: const Icon(Icons.close),
                  tooltip: 'Exit',
                  onPressed: () {
                    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                  },
                ),*/
            ],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25)),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate(
            <Widget>[
              tappableCard(
                  "Disciplinas",
                  "Selecione aqui para visualizar e gerenciar a lista de disciplinas",
                  () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => new Subjects(addNewSubject),
                        ),
                      )),
              tappableCard(
                  "Competências",
                  "Selecione aqui para visualizar e gerenciar a lista de competências",
                  () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => new Subjects(addNewSubject),
                        ),
                      )),
              tappableCard(
                  "Habilidades",
                  "Selecione aqui para visualizar e gerenciar a lista de habilidades",
                  () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => new Student(
                            this.subjects.isEmpty
                                ? defaultHabilities
                                : this
                                    .subjects
                                    .first
                                    .competences
                                    .first
                                    .habilities,
                          ),
                        ),
                      )),
            ],
          ))
        ],
      ),
    );
  }
}
