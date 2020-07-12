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
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
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
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              dimension.name,
                                            ),
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
              RaisedButton(
                child: Text("Criar habilidade"),
                onPressed: submitData,
              )
            ],
          ),
        ),
      ),
    );
  }
}
