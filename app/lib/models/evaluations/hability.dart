import 'package:ArcGraph/models/evaluations/dimensionToEvaluate.dart';

class Hability
{
    Hability(String name, List<DimensionToEvaluate> dimensions)
    {
      this.name = name;
      this.dimensions = dimensions;
    }
    String name;
    List<DimensionToEvaluate> dimensions;
}
