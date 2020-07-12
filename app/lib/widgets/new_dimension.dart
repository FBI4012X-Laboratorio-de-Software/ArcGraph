import 'package:ArcGraph/models/evaluations/dimensionToEvaluate.dart';
import 'package:flutter/material.dart';

class NewDimension extends StatefulWidget {
  Function addNewDimension;
  DimensionToEvaluate dimension;

  NewDimension.function(this.addNewDimension);
  NewDimension.dimension(this.dimension);

  @override
  _NewDimensionState createState() => _NewDimensionState(
        this.dimension?.name ?? "",
        this.dimension?.weight ?? 0,
      );
}

class _NewDimensionState extends State<NewDimension> {
  TextEditingController nameController;
  TextEditingController weightController;

  _NewDimensionState(String name, double weight) {
    this.nameController = TextEditingController(text: name);
    this.weightController = TextEditingController(text: weight.toString());
  }

  void submitData() {
    if (nameController.text.isEmpty) {
      return;
    }

    if (weightController.text.isEmpty) {
      return;
    }

    final name = nameController.text;
    final weight = double.parse(weightController.text);

    if (widget.dimension == null)
      widget.addNewDimension(
        name,
        weight,
      );
    else {
      widget.dimension.name = name;
      widget.dimension.weight = weight;
    }

    Navigator.of(context).pop();
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
                decoration: InputDecoration(labelText: 'Nome:'),
                controller: nameController,
                onSubmitted: (_) {},
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Peso:'),
                controller: weightController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) {},
              ),
              RaisedButton(
                child: Text("Criar dimensão"),
                onPressed: submitData,
              )
            ],
          ),
        ),
      ),
    );
  }
}
