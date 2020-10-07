import 'package:flutter/material.dart';

fab() {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(14.0),
      child: ListView(
        padding: EdgeInsets.all(14.0),
        children: [
          Builder(
              builder: (context) => Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FlatButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/tracks');
                          },
                          child: Text('T R A C K S')),
                      SizedBox(
                        height: 28.0,
                      ),


                      FlatButton(
                          splashColor: Colors.teal[300],
                          onPressed: () {
                            Navigator.pushNamed(context, '/video');
                          },
                          child: Text('V I D E O'))
                    ],
                  ))
        ],
      ),
    ),
  );
}
