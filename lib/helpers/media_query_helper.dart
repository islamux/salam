import 'package:flutter/material.dart';

// todo : refactor code later
extension MediaQueryHelper on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
}
