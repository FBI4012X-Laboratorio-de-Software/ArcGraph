import 'dart:convert';
import 'dart:io';
import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';

class FileHandler {
  void Import() {
    final input = FilePicker.getFile();
  }
}
