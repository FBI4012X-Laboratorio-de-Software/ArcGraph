import 'package:ArcGraph/FileHandler.dart';
import 'package:flutter/material.dart';

class Subjects extends StatelessWidget {
  final FileHandler fileHandler = new FileHandler();

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
                        onPressed: () => fileHandler.Import(),
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
