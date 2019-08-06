import 'package:flutter/material.dart';
import 'package:provider_flutter/providers/value_provider.dart';
import 'package:provider/provider.dart';

class FABminus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var counter = Provider.of<ValueProvider>(context);
    return FloatingActionButton(
        backgroundColor: Colors.red,
        child: Text("${counter.value}"),
        onPressed: () => counter.value == 0 ? null : counter.decrement());
  }
}
