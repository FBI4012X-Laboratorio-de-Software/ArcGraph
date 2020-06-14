import 'package:ArcGraph/Evaluated/EvalCompetence.dart';
import 'package:ArcGraph/Evaluations/Competence.dart';
import 'package:ArcGraph/Evaluations/Hability.dart';
import 'package:flutter/material.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';

import 'Evaluated/EvalHability.dart';

// class EvaluationAppPage extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'ArcGraph',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: EvaluationPage(title: 'ArcGraph'),
//     );
//   }
// }

class EvaluationPage extends StatefulWidget {

  EvaluationPage(Competence competence,{Key key, this.title}) : super(key: key)
  {
    this.competence = competence;
  }
  final String title;
  Competence competence;
  @override
  _EvaluationPageState createState() => _EvaluationPageState(competence);
}

class _EvaluationPageState extends State<EvaluationPage> {
  Competence competence;
  EvalCompetence evalCompetence;
  _EvaluationPageState(this.competence){
   evalCompetence = EvalCompetence(competence);

  }

  List<Widget> GetHabilitiesSliders(List<EvalHability> habilities) {
  List<Widget> list = new List<Widget>();
    for (var hability in habilities) {
      list.add(Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(hability.name()),
            Expanded(
                child: Slider(
              value: hability.dimensions.first.grade.toDouble(),
              min: 0,
              max: 100,
              divisions: 1000,
              onChanged: (value) {
                setState(() {
                  hability.dimensions.first.grade = value;
                });
              },
            ))
          ],
        ),
      ));
    }
    return list;
  }

  void GenerateGrades( ) 
  {
      
  }

  Widget build(BuildContext context) {
    
    var ticks = new List<int>();
    for (var i = 0; i < 101; i+=10) {
      ticks.add(i);
    }


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
                //stuff
              //  Navigator.pop(context);
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
                  ),
                )
              ] +
              GetHabilitiesSliders(evalCompetence.evalHabilities) +
              <Widget>[
                Expanded(
                  child: RadarChart(
                    ticksTextStyle: TextStyle(
                      fontSize: 0,
                    ),
                    outlineColor: Colors.black,
                    axisColor: Color.fromRGBO(0, 0, 0, 200),
                    ticks: ticks,
                   // features: features, tava dando erro aí comentei
                   // data: data, aqui tbm
                  ),
                ),
                RaisedButton(onPressed: () { this.GenerateGrades(); },
                                child: const Text('Gerar Nota'),)
                              ],
                        ),
                      ),
                    );
                  }
                
}
