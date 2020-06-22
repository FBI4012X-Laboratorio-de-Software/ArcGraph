import 'package:ArcGraph/models/files/fileHandler.dart';
import 'package:ArcGraph/models/files/fileHandlerWeb.dart';
import 'package:flutter/material.dart';

class Subjects extends StatelessWidget {
  final FileHandlerWeb fileHandler = new FileHandlerWeb();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Disciplinas'),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 6,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          'caminho do csv',
                        ),
                      ),
                      FlatButton(
                        onPressed: () => fileHandler.import(),
                        child: Icon(
                          Icons.search,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
