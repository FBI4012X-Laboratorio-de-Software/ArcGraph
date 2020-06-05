import 'package:ArcGraph/Evaluations/DimensionToEvaluate.dart';

class EvalDimension
{
    DimensionToEvaluate dimension;
    String name()=> this.dimension.name;
    double grade;
    EvalDimension(DimensionToEvaluate dimensionToEvaluate)
    {
      this.dimension = dimensionToEvaluate;
      grade = 0;
    }
}