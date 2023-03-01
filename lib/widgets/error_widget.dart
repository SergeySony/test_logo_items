import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorLoadingWidget extends StatelessWidget {
  const ErrorLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text('Error loading data.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, )
            ),
          ],
        ),
      )
    );
  }
}