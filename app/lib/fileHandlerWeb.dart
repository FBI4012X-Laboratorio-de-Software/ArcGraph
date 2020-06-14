import 'dart:async';
import 'package:ArcGraph/csvReader.dart';
import 'package:file_picker_web/file_picker_web.dart';

class FileHandlerWeb {
  void Import() async {
    final input = await FilePicker.getFile();
    new CsvReader().readDataFromWeb(input);
  }
}
