import 'package:flutter/material.dart';
import 'package:provider_flutter/providers/value_provider.dart';
import 'package:provider/provider.dart';

class FABplus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var counter = Provider.of<ValueProvider>(context);
    return FloatingActionButton(
      backgroundColor: Colors.green,
      child: Text("${counter.value}"),
      onPressed: () {
        counter.increment();
      },
    );
  }
}
