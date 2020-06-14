import 'package:ArcGraph/Evaluations/Competence.dart';
import 'package:ArcGraph/Evaluations/DimensionToEvaluate.dart';
import 'package:ArcGraph/Evaluations/Hability.dart';
import 'package:flutter/material.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';

class Graphs extends StatefulWidget {
  final Competence competence;

  Graphs({Key key, @required this.competence}) : super(key: key);

  @override
  _GraphsState createState() => _GraphsState();
}

class _GraphsState extends State<Graphs> {
  List<Widget> getTabs(Competence competence) {
    List<Widget> result = new List<Widget>();
    for (int i = 0; i < competence.habilities.length; i++) {
      result.add(Tab(text: competence.habilities[i].name));
    }
    return result;
  }

  List<Widget> getTabsContent(Hability hability) {
    List<Widget> result = new List<Widget>();
    for (int j = 0; j < hability.dimensions.length; j++) {
      //sliders das dimensoes de cada habilidade
      var dimension = hability.dimensions[j];
      result.add(Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(dimension.name),
            Expanded(
                child: Slider(
              value: dimension.weight,
              min: 0,
              max: 100,
              divisions: 1000,
              onChanged: (value) {
                setState(() {
                  widget.competence.habilities
                      .firstWhere((x) => x.name == hability.name)
                      .dimensions
                      .firstWhere((y) => y.name == dimension.name)
                      .weight = value;
                });
              },
            ))
          ],
        ),
      ));
    }
    return result;
  }

  Widget getDimensionSlider(DimensionToEvaluate dimension, Hability hability) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(dimension.name),
          Expanded(
              child: Slider(
            value: dimension.weight,
            min: 0,
            max: 100,
            divisions: 1000,
            onChanged: (value) {
              setState(() {
                widget.competence.habilities
                    .firstWhere((x) => x.name == hability.name)
                    .dimensions
                    .firstWhere((y) => y.name == dimension.name)
                    .weight = value;
              });
            },
          ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var tabsNumber = 3;
    var ticks = new List<int>();
    for (var i = 0; i < 101; i += 10) {
      ticks.add(i);
    }

    return Container(
      child: DefaultTabController(
        length: tabsNumber,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: this.getTabs(widget.competence),
            ),
          ),
          body: TabBarView(
            children: [
              for (int i = 0; i < widget.competence.habilities.length; i++)
                Container(
                  child: Column(
                    children: [
                          for (int j = 0;
                              j <
                                  widget.competence.habilities[i].dimensions
                                      .length;
                              j++)
                            this.getDimensionSlider(
                                widget.competence.habilities[i].dimensions[j],
                                widget.competence.habilities[i])
                        ] +
                        <Widget>[
                          Expanded(
                            child: RadarChart(
                              ticksTextStyle: TextStyle(
                                fontSize: 0,
                              ),
                              outlineColor: Colors.black,
                              axisColor: Color.fromRGBO(0, 0, 0, 200),
                              ticks: ticks,
                              features: widget
                                  .competence.habilities[i].dimensions
                                  .map((e) => e.name).toList(),
                              data: [
                                List<int>.from(widget
                                    .competence.habilities[i].dimensions
                                    .map((e) => e.weight.floor())
                                    .toList())
                              ],
                            ),
                          ),
                        ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
