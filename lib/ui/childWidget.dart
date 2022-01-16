import 'package:flutter/material.dart';
import 'package:projet1/ui/danger.dart';
import 'package:projet1/ui/principale.dart';
import 'package:projet1/ui/instructions.dart';

class ChildWidget extends StatelessWidget {
  final AvailableNumber number;

  ChildWidget({Key key, this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (number == AvailableNumber.First) {
      return HomePage();
    } else if (number == AvailableNumber.Second) {
      return Danger();
    } else {
      return Instructions();
    }
  }
}

enum AvailableNumber { First, Second, Third }
