import 'package:ArcGraph/models/evaluations/dimensionToEvaluate.dart';

class Hability {
  Hability(String name, List<DimensionToEvaluate> dimensions) {
    this.name = name;
    this.dimensions = dimensions;
  }
  String name;
  List<DimensionToEvaluate> dimensions;

  double average() {
    double sum = 0;
    for (var dimension in dimensions) {
      sum += dimension.value * dimension.weight;
    }

    return sum;
  }
}
