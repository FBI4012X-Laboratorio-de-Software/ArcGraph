import 'package:ArcGraph/models/evaluations/dimensionToEvaluate.dart';
import 'package:ArcGraph/models/evaluations/hability.dart';
import 'package:ArcGraph/widgets/new_dimension.dart';
import 'package:flutter/material.dart';

class NewHability extends StatefulWidget {
  Function addNewHability;
  Hability hability;

  NewHability.function(this.addNewHability);
  NewHability.hability(this.hability);

  @override
  _NewHabilityState createState() => _NewHabilityState(
        this.hability?.name ?? "",
        this.hability?.dimensions ?? new List<DimensionToEvaluate>(),
      );
}

class _NewHabilityState extends State<NewHability> {
  TextEditingController nameController;
  List<DimensionToEvaluate> dimensions;

  _NewHabilityState(
    String name,
    List<DimensionToEvaluate> dimensions,
  ) {
    this.nameController = TextEditingController(text: name);
    this.dimensions = dimensions;
  }

  void submitData() {
    if (nameController.text.isEmpty) {
      return;
    }

    if (widget.hability == null)
      widget.addNewHability(
        nameController.text,
        dimensions,
      );
    else {
      widget.hability.name = nameController.text;
      widget.hability.dimensions = dimensions;
    }

    Navigator.of(context).pop();
  }

  void cancel() {
    Navigator.of(context).pop();
  }

  void addNewDimension(String name, double weight) {
    final dimension = new DimensionToEvaluate(name, weight);

    setState(() {
      dimensions.add(dimension);
    });
  }

  void startAddNewDimension(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (builderContext) {
        return GestureDetector(
          onTap: () {},
          child: NewDimension.function(addNewDimension),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void startEditDimension(
    BuildContext context,
    DimensionToEvaluate dimension,
  ) {
    showModalBottomSheet(
      context: context,
      builder: (builderContext) {
        return GestureDetector(
          onTap: () {},
          child: NewDimension.dimension(dimension),
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
                  text: "Habilidade",
                  style: TextStyle(
                    color: Colors.black,
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
                decoration: InputDecoration(labelText: 'Nome'),
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
                        child: dimensions.isEmpty
                            ? Text("Nenhuma dimensão cadastrada.")
                            : Column(
                                children: dimensions
                                    .map(
                                      (dimension) => GestureDetector(
                                        onLongPress: () => startEditDimension(
                                          context,
                                          dimension,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            IconButton(
                                                icon: Icon(Icons.edit),
                                                onPressed: () {
                                                  startEditDimension(
                                                    context,
                                                    dimension,
                                                  );
                                                }),
                                            Text(
                                              dimension.name,
                                            ),
                                            Spacer(flex: 2),
                                            Text(
                                              dimension.weight.toString(),
                                            ),
                                            IconButton(
                                                icon: Icon(Icons.delete),
                                                onPressed: () {
                                                  setState(() {
                                                    dimensions
                                                        .remove(dimension);
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
                            onPressed: () => startAddNewDimension(context),
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
