import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveFlatButton extends StatelessWidget {
  final title;
  final Function handler;

  AdaptiveFlatButton(this.title, this.handler);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text('Choose Date',
                style: TextStyle(fontWeight: FontWeight.bold)),
            onPressed: handler)
        : FlatButton(
            onPressed: handler,
            child: Text('Choose Date',
                style: TextStyle(fontWeight: FontWeight.bold)),
            textColor: Theme.of(context).primaryColor,
          );
  }
}
