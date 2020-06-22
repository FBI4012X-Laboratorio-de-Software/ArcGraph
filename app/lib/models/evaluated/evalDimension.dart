import 'package:ArcGraph/models/evaluations/dimensionToEvaluate.dart';

class EvalDimension
{
    DimensionToEvaluate evalDimension;
    String name()=> this.evalDimension.name;
    double grade;
    EvalDimension(DimensionToEvaluate dimensionToEvaluate)
    {
      this.evalDimension = dimensionToEvaluate;
      grade = 0;
    }
}