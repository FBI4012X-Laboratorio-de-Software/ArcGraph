import 'dart:async';
import 'package:ArcGraph/models/files/csvReader.dart';
import 'package:file_picker/file_picker.dart';
import '../subject.dart';

class FileHandler {
  Future<Subject> import() async {
    final input = await FilePicker.getFile();
    return new CsvReader().readData(input);
  }
}
