import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'dart:html' as html;
import 'package:csv/csv.dart';
import 'package:path_provider/path_provider.dart';

class CsvReader {
  Future<String> get localPath async {
    final dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }

  Future<File> get localFile async {
    final path = await localPath;
    return File('$path/teste.csv');
  }

  void readData(File file) async {
    final input = file.openRead();
    final csv = await input
        .transform(utf8.decoder)
        .transform(new CsvToListConverter())
        .toList();
    print(csv);
  }

  void readDataFromWeb(html.File file) async {
    print("entrei");
    final blob = file.slice(0, file.size);

    html.FileReader reader = new html.FileReader();
    var stream = reader.onLoadEnd.first.then(
      (_) {
        return reader.result;
      },
    ).asStream();

    reader.readAsArrayBuffer(blob);

    final csv = await (stream.cast<List<int>>())
        .transform(utf8.decoder)
        .transform(new CsvToListConverter())
        .toList();

    print(csv);
  }
}
