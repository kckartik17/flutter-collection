import 'package:flip_card/flip_card.dart';
import 'package:flip_panel/tracking_text_input.dart';
import 'package:flutter/material.dart';
import 'package:flip_panel/teddy_controller.dart';
import 'package:flare_flutter/flare_actor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  TeddyController _teddyController;
  @override
  initState() {
    _teddyController = TeddyController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget signup() {
      return Card(
        elevation: 10.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text("Sign Up",
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: TrackingTextInput(
                    label: "Email",
                    hint: "Enter email",
                    onCaretMoved: (Offset caret) {
                      _teddyController.lookAt(caret);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: TrackingTextInput(
                    label: "Password",
                    hint: "Enter password",
                    isObscured: true,
                    onCaretMoved: (Offset caret) {
                      _teddyController.coverEyes(caret != null);
                      _teddyController.lookAt(null);
                    },
                    onTextChanged: (String value) {
                      _teddyController.setPassword(value);
                    },
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: TrackingTextInput(
                        label: "Confirm Password",
                        hint: "Re-enter password",
                        isObscured: true,
                        onCaretMoved: (Offset caret) {
                          _teddyController.coverEyes(caret != null);
                          _teddyController.lookAt(null);
                        },
                        onTextChanged: (String value) {
                          _teddyController.setPassword(value);
                        })),
                Container(
                  height: 50.0,
                  child: SizedBox.expand(
                    child: RaisedButton(
                      color: Colors.blue[200],
                      splashColor: Colors.blue[500],
                      elevation: 10.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Text(
                        "Sign up",
                        style: TextStyle(fontSize: 15.0),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Already have a account ? "),
                    SizedBox(
                      width: 5.0,
                    ),
                    InkWell(
                      onTap: () {
                        cardKey.currentState.toggleCard();
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
    }

    Widget signin() {
      return Card(
        elevation: 10.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text("Sign In",
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: TrackingTextInput(
                    label: "Email",
                    hint: "Enter email",
                    onCaretMoved: (Offset caret) {
                      _teddyController.lookAt(caret);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: TrackingTextInput(
                    label: "Password",
                    hint: "Enter password",
                    isObscured: true,
                    onCaretMoved: (Offset caret) {
                      _teddyController.coverEyes(caret != null);
                      _teddyController.lookAt(null);
                    },
                    onTextChanged: (String value) {
                      _teddyController.setPassword(value);
                    },
                  ),
                ),
                Container(
                  alignment: Alignment(1.0, 0.0),
                  child: InkWell(
                    child: Text(
                      "Forgot Password ?",
                      style: TextStyle(fontSize: 13.0),
                    ),
                    onTap: () {
                      print("Fogot Password");
                    },
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                Container(
                  height: 50.0,
                  child: SizedBox.expand(
                    child: RaisedButton(
                      color: Colors.blue[200],
                      splashColor: Colors.blue[500],
                      elevation: 10.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Text(
                        "Sign in",
                        style: TextStyle(fontSize: 15.0),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Divider(
                        height: 5.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text("OR"),
                    ),
                    Expanded(
                      child: Divider(),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Material(
                      elevation: 10.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0)),
                      child: Container(
                        height: 50.0,
                        width: 100.0,
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {},
                            child: Image.asset("assets/google.png"),
                          ),
                        ),
                      ),
                    ),
                    Material(
                      elevation: 10.0,
                      color: Color.fromRGBO(41, 72, 125, 1.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0)),
                      child: Container(
                        height: 50.0,
                        width: 100.0,
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {},
                            child: Image.asset("assets/facebook.png"),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.0,
                ),
                Wrap(
                  direction: Axis.horizontal,
                  // runSpacing: 10.0,
                  alignment: WrapAlignment.end,
                  children: <Widget>[
                    Text("Don't have a account ? "),
                    SizedBox(
                      width: 5.0,
                    ),
                    InkWell(
                      onTap: () {
                        cardKey.currentState.toggleCard();
                      },
                      child: Text(
                        "Create an account.",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
        body: SafeArea(
      child: Container(
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.blue[900], Colors.blue[200]],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft),
                ),
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 150,
                    child: FlareActor(
                      "assets/Teddy.flr",
                      shouldClip: false,
                      alignment: Alignment.bottomCenter,
                      fit: BoxFit.contain,
                      controller: _teddyController,
                    ),
                  ),
                  Container(
                    height: 533,
                    child: FlipCard(
                      front: signin(),
                      back: signup(),
                      key: cardKey,
                      direction: FlipDirection.HORIZONTAL,
                      flipOnTouch: false,
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    ));
  }
}
