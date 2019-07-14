import 'package:flutter/material.dart';
import 'package:minion_app/models/character.dart';
import 'package:minion_app/styleguide.dart';
import 'package:minion_app/widgets/character_widget.dart';

class CharacterListingScreen extends StatefulWidget {
  @override
  _CharacterListingScreenState createState() => _CharacterListingScreenState();
}

class _CharacterListingScreenState extends State<CharacterListingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios,
          size: 30,
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.search,
              size: 30,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 8.0),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(text: "Despicable Me", style: AppTheme.display1),
                    TextSpan(text: "\n"),
                    TextSpan(text: "Characters", style: AppTheme.display2)
                  ]),
                ),
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: characters.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 0.05 * (MediaQuery.of(context).size.width)),
                    child: CharacterWidget(index: index),
                  );
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
