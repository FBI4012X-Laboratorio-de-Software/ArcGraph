import 'package:ArcGraph/Evaluations/Competence.dart';
import 'package:ArcGraph/Evaluations/Hability.dart';

class EvalCompetence
{
  Competence competence;
  String name()=>competence.name;
  List<Hability> habilities;
  EvalCompetence(Competence competence)
  {
    this.competence = competence;
    for (var item in competence.habilities) {
      
    }
  }
}