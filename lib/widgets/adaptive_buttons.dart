import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveButton extends StatelessWidget {
  final Function buttonHandler;
  final String label;

  AdaptiveButton(this.buttonHandler, this.label);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(label),
            onPressed: buttonHandler,
          )
        : ElevatedButton(
            onPressed: buttonHandler,
            style: ElevatedButton.styleFrom(
                textStyle: Theme.of(context).textTheme.button),
            child: Text(label),
          );
  }
}
