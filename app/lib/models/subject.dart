import 'package:ArcGraph/models/evaluations/competence.dart';

import 'student.dart';
import 'test.dart';

class Subject {
  int id;
  String name;
  String register;
  String time;
  String location;
  String professor;
  List<Student> students;
  List<Test> tests;
  List<Competence> competences;

  Subject(this.name, this.register, this.professor) {
    students = new List<Student>();
    tests = new List<Test>();
    competences = new List<Competence>();
  }
}
