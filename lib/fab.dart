import 'package:flutter/material.dart';

fab() {
  return Container(
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: ListView(
          padding: EdgeInsets.all(14.0),
          children: [
            Builder(
                builder: (context) => Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * .3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          FlatButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/tracks');
                              },
                              child: Text('T R A C K S')),
                          FlatButton(
                              splashColor: Colors.teal[300],
                              onPressed: () {
                                Navigator.pushNamed(context, '/video');
                              },
                              child: Text('V I D E O'))
                        ],
                      ),
                    ))
          ],
        ),
      ),
    ),
  );
}
