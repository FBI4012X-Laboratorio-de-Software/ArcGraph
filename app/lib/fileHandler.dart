import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:ArcGraph/csvReader.dart';
import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';

class FileHandler {
  void Import() async {
    final input = await FilePicker.getFile();
    new CsvReader().readData(input);
  }
}
