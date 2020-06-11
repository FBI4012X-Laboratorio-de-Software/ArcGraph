import 'Hability.dart';
class Competence
{
    Competence(String name, List<Hability> habilities)
    {
      this.name = name;
      this.habilities = habilities;
    }
    String name;
    List<Hability> habilities;
}