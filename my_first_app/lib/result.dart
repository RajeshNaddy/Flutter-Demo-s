import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Result extends StatelessWidget {
  final int score;
  final VoidCallback callback;
  Result(this.score, this.callback);

  String get resultPhrase {
    return "We did it. The score is " + score.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(resultPhrase,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        FlatButton(onPressed: callback, child: Text("Restart Quiz!"))
      ],
    );
  }
}
