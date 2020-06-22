import 'package:ArcGraph/models/evaluations/hability.dart';
import 'package:ArcGraph/models/evaluated/evalDimension.dart';

class EvalHability
{
    String name()=>this.hability.name;
    Hability hability;
    List<EvalDimension> dimensions = new List<EvalDimension>();
    EvalHability(Hability hability)
    {
      this.hability = hability;
      for (var dimension in hability.dimensions) {
        this.dimensions.add(new EvalDimension(dimension));
      }
    }
}
