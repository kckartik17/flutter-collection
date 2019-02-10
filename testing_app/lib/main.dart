import 'package:flutter/material.dart';
import './login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {'/login': (context) => LoginPage()},
      theme: ThemeData(fontFamily: 'Product', primaryColor: Colors.red),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Sign Up',
          ),
          elevation: 8.0,
          backgroundColor: Colors.red,
          actions: <Widget>[
            PopupMenuButton(
              itemBuilder: (BuildContext context) {
                return [PopupMenuItem(child: Text('About'))];
              },
            )
          ],
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Please take a moment to verify your phone number.',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 15.0),
                  Text(
                    'We will send you a One Time Passcode.',
                    style: TextStyle(color: Colors.blue),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    width: 250.0,
                    height: 50.0,
                    child: TextField(
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          counterText: "",
                          labelText: 'Mobile Number',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)))),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                      height: 55.0,
                      width: 150.0,
                      child: GestureDetector(
                        onTap: () {
                          print('Button clicked');
                        },
                        child: Material(
                          borderRadius: BorderRadius.circular(27.0),
                          shadowColor: Colors.redAccent,
                          color: Colors.red,
                          elevation: 7.0,
                          child: Center(
                            child: Text(
                              'REQUEST OTP',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Product'),
                            ),
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 40.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Already have an account ?',
                      ),
                      SizedBox(width: 5.0),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: Text(
                          'Log in',
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              fontFamily: 'Product'),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}
