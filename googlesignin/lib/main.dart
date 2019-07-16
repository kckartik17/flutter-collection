import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'signin.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (BuildContext context) {
        return Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onDoubleTap: () {
                print("Hello");
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text('Hello'),
                  backgroundColor: Colors.blue,
                  action: SnackBarAction(
                    label: 'Sign In',
                    textColor: Colors.black,
                    onPressed: () {},
                  ),
                ));
              },
              child: FlutterLogo(
                size: MediaQuery.of(context).size.height * 0.3,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            GoogleSignInButton(
              onPressed: () {
                signInWithGoogle().whenComplete(() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SecondScreen()));
                });
              },
            ),
          ],
        ));
      }),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blue, Colors.blue[100]],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(imageURL),
                radius: 60,
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                name,
                style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.black45,
                    fontStyle: FontStyle.italic),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                email,
                style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.black45,
                    fontStyle: FontStyle.italic),
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                height: 50.0,
                width: MediaQuery.of(context).size.width * 0.3,
                child: RaisedButton(
                  color: Colors.red,
                  splashColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0)),
                  child: Text('Sign Out'),
                  onPressed: () {
                    signOutGoogle();
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}
