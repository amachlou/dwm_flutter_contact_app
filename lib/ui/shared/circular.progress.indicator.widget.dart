import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircularProgressIndicator extends StatelessWidget {
  String errorMessage;
  Function onAction;

  CircularProgressIndicator({ this.errorMessage, this.onAction});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("${errorMessage}"),
        RaisedButton(onPressed: () => onAction,
          child: Text('Retry', style: TextStyle(color: Colors.white),), color: Colors.greenAccent,)
      ],
    );
  }
}
