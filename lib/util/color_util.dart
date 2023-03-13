import 'package:flutter/material.dart';

final _colors = <String,Color> {
  'primary': const Color.fromARGB(255, 16, 122, 85),
};

Color? getColor(String? color){
  return _colors[color];
}