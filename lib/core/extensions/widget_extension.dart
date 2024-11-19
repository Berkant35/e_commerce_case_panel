import 'package:flutter/material.dart';

//https://stackoverflow.com/questions/52774921/space-between-columns-children-in-flutter

/// Widget extension to add space between widgets
extension ListSpaceBetweenExtension on List<Widget> {
  List<Widget> withSpaceBetween({double? width, double? height}) => [
    for (int i = 0; i < length; i++)
      ...[
        if (i > 0)
          SizedBox(width: width, height: height),
        this[i],
      ],
  ];
}