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

  Subject(this.name, this.register, this.professor);
}