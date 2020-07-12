import 'package:ArcGraph/models/evaluations/competence.dart';
import 'package:ArcGraph/models/evaluations/dimensionToEvaluate.dart';
import 'package:ArcGraph/models/evaluations/hability.dart';
import 'package:ArcGraph/widgets/new_hability.dart';
import 'package:flutter/material.dart';

class NewCompetence extends StatefulWidget {
  Function addNewCompetence;
  Competence competence;

  NewCompetence.function(this.addNewCompetence);
  NewCompetence.competence(this.competence);

  @override
  _NewCompetenceState createState() => _NewCompetenceState(
        this.competence?.name ?? "",
        this.competence?.habilities ?? new List<Hability>(),
      );
}

class _NewCompetenceState extends State<NewCompetence> {
  TextEditingController nameController;
  List<Hability> habilities;

  _NewCompetenceState(
    String name,
    List<Hability> habilities,
  ) {
    this.nameController = TextEditingController(text: name);
    this.habilities = habilities;
  }

  void submitData() {
    if (nameController.text.isEmpty) {
      return;
    }

    if (widget.competence == null)
      widget.addNewCompetence(
        nameController.text,
        habilities,
      );
    else {
      widget.competence.name = nameController.text;
      widget.competence.habilities = habilities;
    }

    Navigator.of(context).pop();
  }

  void cancel() {
    Navigator.of(context).pop();
  }

  void addNewHability(
    String name,
    List<DimensionToEvaluate> dimensions,
  ) {
    final hability = new Hability(name, dimensions);

    setState(() {
      habilities.add(hability);
    });
  }

  void startAddNewHability(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (builderContext) {
        return GestureDetector(
          onTap: () {},
          child: NewHability.function(addNewHability),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void startEditHability(
    BuildContext context,
    Hability hability,
  ) {
    showModalBottomSheet(
      context: context,
      builder: (builderContext) {
        return GestureDetector(
          onTap: () {},
          child: NewHability.hability(hability),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              RichText(
                text: TextSpan(
                  text: "Competência",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(
                color: Colors.grey.withAlpha(200),
                thickness: 1,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Nome:'),
                controller: nameController,
                onSubmitted: (_) {},
              ),
              Card(
                elevation: 6,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                        child: habilities.isEmpty
                            ? Text("Nenhuma habilidade cadastrada.")
                            : Column(
                                children: habilities
                                    .map(
                                      (hability) => GestureDetector(
                                        onLongPress: () => startEditHability(
                                          context,
                                          hability,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            IconButton(
                                                icon: Icon(Icons.edit),
                                                onPressed: () {
                                                  startEditHability(
                                                    context,
                                                    hability,
                                                  );
                                                }),
                                            Text(
                                              hability.name,
                                            ),
                                            Spacer(flex: 2),
                                            IconButton(
                                                icon: Icon(Icons.delete),
                                                onPressed: () {
                                                  setState(() {
                                                    habilities.remove(hability);
                                                  });
                                                }),
                                          ],
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          RaisedButton(
                            shape: CircleBorder(),
                            onPressed: () => startAddNewHability(context),
                            child: Icon(
                              Icons.add,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RaisedButton(
                    color: Color.fromRGBO(200, 80, 80, 0.5),
                    shape: CircleBorder(),
                    child: Icon(Icons.close),
                    onPressed: cancel,
                  ),
                  RaisedButton(
                    color: Color.fromRGBO(80, 200, 80, 0.5),
                    shape: CircleBorder(),
                    child: Icon(Icons.check),
                    onPressed: submitData,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
