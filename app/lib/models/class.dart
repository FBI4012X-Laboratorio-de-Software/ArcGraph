import 'package:ArcGraph/models/evaluations/competence.dart';
import 'package:ArcGraph/models/student.dart';

class Class {
  String code;
  String discipline;
  String description;
  String hour;
  String location;
  List<Competence> competences;
  List<Student> students;

  Class(
    this.discipline,
    this.description,
    this.competences,
    this.students,
  ) {
    this.competences = this.competences ?? new List<Competence>();
    this.students = this.students ?? new List<Student>();
  }
}
