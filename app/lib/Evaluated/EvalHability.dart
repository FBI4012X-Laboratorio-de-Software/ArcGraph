import 'package:ArcGraph/Evaluated/EvalDimension.dart';
import 'package:ArcGraph/Evaluations/Hability.dart';

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
