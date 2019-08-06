import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multiple FAB buttons'),
        centerTitle: true,
      ),
      body: Center(
        child: Text("Welcome"),
      ),
      floatingActionButton: SpeedDial(
        overlayOpacity: 0.95,
        overlayColor: Colors.grey,
        animatedIcon: AnimatedIcons.menu_arrow,
        children: [
          SpeedDialChild(
            child: Icon(Icons.add_a_photo),
            label: "Camera",
            onTap: () => print("First"),
          ),
          SpeedDialChild(
            child: Icon(Icons.add_call),
            label: "Call",
            onTap: () => print("Call"),
          ),
          SpeedDialChild(
            child: Icon(Icons.add_alert),
            label: "Alarm",
            onTap: () => print("Alaram"),
          )
        ],
      ),
    );
  }
}
