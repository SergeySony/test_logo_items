import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActivityIndicator extends StatelessWidget {
  const ActivityIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            CupertinoActivityIndicator(radius: 30.0),
            SizedBox(height: 10),
          Text('Loading data',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, )
          ),
          ],
        ),
      )
    );
  }
}