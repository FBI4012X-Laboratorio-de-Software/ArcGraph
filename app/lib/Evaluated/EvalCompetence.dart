import 'package:ArcGraph/Evaluated/EvalHability.dart';
import 'package:ArcGraph/Evaluations/Competence.dart';

class EvalCompetence
{
  Competence competence;
  String name()=>competence.name;
  List<EvalHability> evalHabilities = new List<EvalHability>();

  EvalCompetence(Competence competence)
  {
    this.competence = competence;
    for (var hability in competence.habilities) {
      evalHabilities.add(new EvalHability(hability));
    }
  }
}