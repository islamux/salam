import 'package:flutter/material.dart';

extension NavigationHelper on BuildContext {
  void pushNamed(String routeName) {
    // Navigator.of(this).push(MaterialPageRoute(builder: (context) => widget));
    Navigator.pushNamed(this, routeName);
  }
}
