import 'package:flutter/material.dart';
import 'package:loja_virtual/counter.dart';
import 'package:provider/provider.dart';

class WidgetCounter extends StatelessWidget {

  // const WidgetCounter(this.count);

  final int count = 0;

  @override
  Widget build(BuildContext context) {
    return Text(
        '${context.watch<Counter>().count}',
        style: Theme.of(context).textTheme.headline4,
    );
  }
}
