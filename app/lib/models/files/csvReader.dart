import 'dart:convert';
import 'dart:io';
import 'dart:async';
// import 'dart:html' as html;
import 'package:csv/csv.dart';
import 'package:path_provider/path_provider.dart';
import '../student.dart';
import '../subject.dart';
import '../test.dart';

class CsvReader {
  Future<String> get localPath async {
    final dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }

  Future<File> get localFile async {
    final path = await localPath;
    return File('$path/teste.csv');
  }

  Future<Subject> readData(File file) async {
    if (file == null) return null;

    final input = file.openRead();
    final csv = await input
        .transform(utf8.decoder)
        .transform(new CsvToListConverter())
        .toList();
    return setData(csv);
  }

  Subject setData(List<List<dynamic>> csv) {
    var subject = new Subject(csv[4][2], csv[3][2], csv[6][2]);
    var schedule = csv[5][2].toString().split('/');
    subject.time = schedule[0];
    subject.location = schedule[1];

    for (var x = 10; x < csv.length; x++) {
      subject.students.add(new Student(csv[x][2], csv[x][1]));
    }

    int x = 3;
    while (csv[8][x].toString().startsWith("Aval")) {
      subject.tests.add(new Test(csv[6][x], 10));
      x++;
    }

    return subject;
  }

  // void readDataFromWeb(html.File file) async {
  //   print("entrei");
  //   final blob = file.slice(0, file.size);

  //   html.FileReader reader = new html.FileReader();
  //   var stream = reader.onLoadEnd.first.then(
  //     (_) {
  //       return reader.result;
  //     },
  //   ).asStream();

  //   reader.readAsArrayBuffer(blob);

  //   final csv = await (stream.cast<List<int>>())
  //       .transform(utf8.decoder)
  //       .transform(new CsvToListConverter())
  //       .toList();

  //   print(csv);
  // }
}
