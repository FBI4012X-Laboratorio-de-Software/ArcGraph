import 'dart:async';
import 'package:ArcGraph/models/files/csvReader.dart';
import 'package:file_picker_web/file_picker_web.dart';

class FileHandlerWeb {
  void import() async {
    final input = await FilePicker.getFile();
    new CsvReader().readDataFromWeb(input);
  }
}
