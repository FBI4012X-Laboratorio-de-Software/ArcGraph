import 'package:ArcGraph/models/evaluations/hability.dart';
import 'package:ArcGraph/models/evaluations/dimensionToEvaluate.dart';
import 'package:ArcGraph/widgets/evaluator.dart';
import 'package:flutter/material.dart';

class Student extends StatelessWidget {
  final List<Hability> habilities;

  Student(this.habilities);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Evaluator(this.habilities),
      ),
    );
  }
}
