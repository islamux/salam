// Helper function to create TextSpan based on content and style
import 'package:flutter/material.dart';

TextSpan customTextSpan(String? text, TextStyle? style) {
  return TextSpan(text: text ?? '', style: style);
}
