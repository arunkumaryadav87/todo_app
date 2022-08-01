import 'package:flutter/material.dart';
import 'package:todo_app/app/utils/dimensions.dart';

class StandardSpacing extends StatelessWidget {
  const StandardSpacing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.standardMargin,
    );
  }
}
