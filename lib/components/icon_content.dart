import 'package:flutter/material.dart';
import '../consts.dart';
class IconContent extends StatelessWidget {
  final IconData usedIcon;
  final String label;



  IconContent({this.usedIcon, this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          usedIcon,
          size: 80.0,
        ),
        Text(
          label,
          style: klabelTextSTyle,
        ),
      ],
    );
  }
}
