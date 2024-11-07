import 'package:flutter/material.dart';

// todo Look to make  navigation is shorter
extension NavigationHelper on BuildContext {
  void pushNamed(Widget widget) {
    Navigator.of(this).push(MaterialPageRoute(builder: (context) => widget));
  }
}
