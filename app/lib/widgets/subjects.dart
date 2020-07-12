import 'package:ArcGraph/models/evaluations/dimensionToEvaluate.dart';
import 'package:ArcGraph/models/evaluations/hability.dart';
import 'package:ArcGraph/models/files/fileHandler.dart';
import 'package:ArcGraph/widgets/hability_view.dart';
// import 'package:ArcGraph/models/files/fileHandlerWeb.dart';
import 'package:flutter/material.dart';
import '../models/subject.dart';

class Subjects extends StatefulWidget {
  @override
  _SubjectsState createState() => _SubjectsState();
}

class _SubjectsState extends State<Subjects> {
  final FileHandler fileHandler = new FileHandler();

  final codeController = TextEditingController();
  final disciplineController = TextEditingController();
  final descriptionController = TextEditingController();
  final hourController = TextEditingController();
  final locationController = TextEditingController();

  final habilitiesView = new List<HabilityView>();

  bool codeFieldContainsError = false;
  bool disciplineFieldContainsError = false;
  bool descriptionFieldContainsError = false;
  bool hourFieldContainsError = false;
  bool locationFieldContainsError = false;
  Subject subject;

  void submitData() {
    setState(() {
      codeFieldContainsError = codeController.text.isEmpty;
      disciplineFieldContainsError = disciplineController.text.isEmpty;
      descriptionFieldContainsError = descriptionController.text.isEmpty;
      hourFieldContainsError = hourController.text.isEmpty;
      locationFieldContainsError = locationController.text.isEmpty;
    });

    if (codeController.text.isEmpty ||
        disciplineController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        hourController.text.isEmpty ||
        locationController.text.isEmpty) return;

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Disciplinas'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Card(
                elevation: 6,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          'Caminho do csv:',
                        ),
                      ),
                      FlatButton(
                        onPressed:()
                        {
                          subject = fileHandler.import() as Subject;
                          codeController.text = subject.register;
                          disciplineController.text = subject.name;
                          descriptionController.text = subject.name ;
                          hourController.text = subject.time;
                          locationController.text = subject.location;
                        },
                        child: Icon(
                          Icons.search,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 6,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'Código:',
                            errorText: codeFieldContainsError ? '!' : null),
                        controller: codeController,
                        onChanged: (value) {
                          setState(() {
                            codeFieldContainsError = value.isEmpty;
                          });
                        },
                      ),
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'Disciplina:',
                            errorText:
                                disciplineFieldContainsError ? '!' : null),
                        controller: disciplineController,
                        onChanged: (value) {
                          setState(() {
                            disciplineFieldContainsError = value.isEmpty;
                          });
                        },
                      ),
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'Descrição:',
                            errorText:
                                descriptionFieldContainsError ? '!' : null),
                        controller: descriptionController,
                        onChanged: (value) {
                          setState(() {
                            descriptionFieldContainsError = value.isEmpty;
                          });
                        },
                      ),
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'Horário:',
                            errorText: hourFieldContainsError ? '!' : null),
                        controller: hourController,
                        onChanged: (value) {
                          setState(() {
                            hourFieldContainsError = value.isEmpty;
                          });
                        },
                      ),
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'Local:',
                            errorText: locationFieldContainsError ? '!' : null),
                        controller: locationController,
                        onChanged: (value) {
                          setState(() {
                            locationFieldContainsError = value.isEmpty;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 6,
                child: Column(
                  children: [
                    Container(
                      child: habilitiesView.isEmpty
                          ? Text("Nenhuma competência cadastrada.")
                          : ExpansionPanelList(
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
                                        padding: const EdgeInsets.only(
                                            left: 20, top: 10),
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
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Column(
                                        children: habilityView
                                            .hability.dimensions
                                            .map<Row>(
                                          (DimensionToEvaluate
                                              dimensionToEvaluate) {
                                            return Row(
                                              children: [
                                                Text(dimensionToEvaluate.name),
                                                Expanded(
                                                  child: Slider(
                                                    value: dimensionToEvaluate
                                                        .value,
                                                    min: 0,
                                                    max: 10,
                                                    divisions: 100,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        dimensionToEvaluate
                                                            .value = value;
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        RaisedButton(
                          shape: CircleBorder(),
                          onPressed: () {},
                          child: Icon(
                            Icons.add,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => submitData(),
        label: Text("Finalizar"),
      ),
    );
  }
}
