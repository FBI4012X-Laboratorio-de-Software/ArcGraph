import 'package:ArcGraph/models/evaluations/competence.dart';
import 'package:ArcGraph/models/evaluated/evalHability.dart';

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