import 'package:flutter/material.dart';
import 'Vids.dart';
import 'tracks.dart';
import 'fab.dart';
import 'body.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/tracks': (context) => Tracks(),
        '/video': (context) => Video(),
      },
      home: Scaffold(
        appBar: AppBar(
          title: Text('M U S I C  P L A Y E R'),
          elevation: 14.0,
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                  Colors.teal[600],
                  Colors.teal[500],
                  Colors.teal[300]
                ])),
          ),
        ),
        body: Body(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
            backgroundColor: Colors.teal[200],
            foregroundColor: Colors.teal[900],
            splashColor: Colors.teal[500],
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) => Container(
                        color: Colors.teal[100],
                        height: 280.0,
                        width: double.infinity,
                        child: fab(),
                      ));
            },
            child: Icon(Icons.all_inclusive),
          ),
        ),
      ),
    );
  }
}
