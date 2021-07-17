import 'package:flutter/material.dart';
import 'package:loja_virtual/widget_counter.dart';

class WidgetCentral extends StatelessWidget {

  // const WidgetCentral(this.count);

  final int count = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'You have pushed the button this many times'
        ),
        WidgetCounter(),
      ],
    );
  }
}
