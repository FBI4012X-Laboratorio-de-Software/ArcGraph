import 'package:ArcGraph/models/evaluations/hability.dart';
import 'package:ArcGraph/models/evaluations/dimensionToEvaluate.dart';
import 'package:ArcGraph/widgets/evaluator.dart';
import 'package:flutter/material.dart';

class Student extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Evaluator(
          [
            new Hability(
              "A",
              [
                new DimensionToEvaluate("1", .4),
                new DimensionToEvaluate("2", .4),
                new DimensionToEvaluate("3", .2),
              ],
            ),
            new Hability(
              "B",
              [
                new DimensionToEvaluate("1", .5),
                new DimensionToEvaluate("2", .5),
              ],
            ),
            new Hability(
              "C",
              [
                new DimensionToEvaluate("1", .2),
                new DimensionToEvaluate("2", .2),
                new DimensionToEvaluate("3", .2),
                new DimensionToEvaluate("4", .2),
                new DimensionToEvaluate("5", .2),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
