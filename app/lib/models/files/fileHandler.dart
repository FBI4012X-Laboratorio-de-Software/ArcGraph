import 'dart:async';
import 'package:ArcGraph/models/files/csvReader.dart';
import 'package:file_picker/file_picker.dart';

class FileHandler {
  void import() async {
    final input = await FilePicker.getFile();
    new CsvReader().readData(input);
  }
}
