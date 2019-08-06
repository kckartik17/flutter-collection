import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_flutter/fabminus.dart';
import 'package:provider_flutter/fabplus.dart';
import 'package:provider_flutter/providers/value_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => ValueProvider(),
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ValueProvider>(
      builder: (context, counter, _) => Scaffold(
        body: Center(
          child: Text(
            "${counter.value}",
            style: TextStyle(fontSize: 50.0),
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: FABplus(),
            ),
            FABminus()
          ],
        ),
      ),
    );
  }
}
