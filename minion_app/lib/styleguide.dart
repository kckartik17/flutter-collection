import 'package:flutter/material.dart';

class AppTheme {
  static const TextStyle display1 = TextStyle(
    fontFamily: 'ProductSans',
    color: Colors.black,
    fontSize: 35,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.2,
  );

  static const TextStyle display2 = TextStyle(
    fontFamily: 'ProductSans',
    color: Colors.black,
    fontSize: 32,
    fontWeight: FontWeight.normal,
    letterSpacing: 1.1,
  );

  static final TextStyle heading = TextStyle(
    fontFamily: 'ProductSans',
    fontWeight: FontWeight.w900,
    fontSize: 34,
    color: Colors.white.withOpacity(0.8),
    letterSpacing: 1.2,
  );

  static final TextStyle subHeading = TextStyle(
    inherit: true,
    fontFamily: 'ProductSans',
    fontWeight: FontWeight.w500,
    fontSize: 24,
    color: Colors.white.withOpacity(0.8),
  );
}
