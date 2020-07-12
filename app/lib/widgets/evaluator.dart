import 'package:ArcGraph/models/evaluations/dimensionToEvaluate.dart';
import 'package:ArcGraph/models/evaluations/hability.dart';
import 'package:ArcGraph/widgets/hability_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';

class Evaluator extends StatefulWidget {
  final List<Hability> habilities;

  Evaluator(this.habilities);

  @override
  _EvaluatorState createState() => _EvaluatorState(this.habilities);
}

class _EvaluatorState extends State<Evaluator> {
  final List<Hability> habilities;
  List<HabilityView> habilitiesView;

  _EvaluatorState(this.habilities) {
    habilitiesView = habilities.map((e) => HabilityView(e, false)).toList();
  }

  @override
  Widget build(BuildContext context) {
    var ticks = new List<int>();
    for (var i = 0; i < 101; i += 10) {
      ticks.add(i);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Notas'),
      ),
      body: habilitiesView.isEmpty
          ? Text("Nenhuma habilidade cadastrada")
          : SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: ExpansionPanelList(
                        expansionCallback: (panelIndex, isExpanded) {
                          setState(() {
                            this.habilitiesView[panelIndex].isExpanded =
                                !isExpanded;
                          });
                        },
                        children: habilitiesView.map<ExpansionPanel>(
                          (HabilityView habilityView) {
                            return ExpansionPanel(
                              headerBuilder: (context, isExpanded) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 10),
                                  child: Text(
                                    habilityView.hability.name,
                                    style: TextStyle(
                                      fontStyle: isExpanded
                                          ? FontStyle.italic
                                          : FontStyle.normal,
                                      fontSize: 20,
                                    ),
                                  ),
                                );
                              },
                              body: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  children:
                                      habilityView.hability.dimensions.map<Row>(
                                    (DimensionToEvaluate dimensionToEvaluate) {
                                      return Row(
                                        children: [
                                          Text(dimensionToEvaluate.name),
                                          Expanded(
                                            child: Slider(
                                              value: dimensionToEvaluate.value,
                                              min: 0,
                                              max: 10,
                                              divisions: 100,
                                              onChanged: (value) {
                                                setState(() {
                                                  dimensionToEvaluate.value =
                                                      value;
                                                });
                                              },
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ).toList(),
                                ),
                              ),
                              isExpanded: habilityView.isExpanded,
                              canTapOnHeader: true,
                            );
                          },
                        ).toList(),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 3,
                      child: RadarChart(
                        ticksTextStyle: TextStyle(
                          fontSize: 0,
                        ),
                        outlineColor: Colors.black,
                        axisColor: Color.fromRGBO(0, 0, 0, 200),
                        ticks: ticks,
                        features: habilitiesView
                            .map((HabilityView h) => h.hability.name)
                            .toList(),
                        data: [
                          habilitiesView
                              .map((HabilityView h) => h.average())
                              .toList(),
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
