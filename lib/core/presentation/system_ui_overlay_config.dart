import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget buildSystemUiOverlay(Widget child) {
  return AnnotatedRegion<SystemUiOverlayStyle>(value: SystemUiOverlayStyle.dark, child: child);
}
