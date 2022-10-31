// ignore_for_file: constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

///   created               : Aditya Pratama
///   originalFilename      : ExDivider
///   date                  : 23 May 2022
///   —————————————————————————————————————————————————————————————————————————————
///   <img width="376" alt="image" src="https://user-images.githubusercontent.com/36602270/169745959-c2b1cc2a-74eb-49a9-83bf-811e8c1d1a65.png">

enum ExDividerMode {
  LINE,
  DASH,
}
enum ExDividerTextMode {
  LEFT,
  CENTER,
  RIGHT,
}

class ExDivider extends StatelessWidget {
  const ExDivider({
    Key? key,
    this.label,
    this.textMode = ExDividerTextMode.CENTER,
    this.dividerMode = ExDividerMode.LINE,
  }) : super(key: key);

  final String? label;
  final ExDividerMode dividerMode;
  final ExDividerTextMode textMode;

  @override
  Widget build(BuildContext context) {
    // if (label == null) {
    //   return Divider();
    // }

    // LINE
    if (label != null && dividerMode == ExDividerMode.LINE && textMode == ExDividerTextMode.CENTER) {
      return HStack([
        Divider().expand(),
        '$label'.text.make().pSymmetric(h: 16),
        Divider().expand(),
      ]);
    } else if (label != null && dividerMode == ExDividerMode.LINE && textMode == ExDividerTextMode.LEFT) {
      return HStack([
        '$label'.text.make(),
        Divider().pOnly(left: 12).expand(),
      ]);
    } else if (label != null && dividerMode == ExDividerMode.LINE && textMode == ExDividerTextMode.RIGHT) {
      return HStack([
        Divider().pOnly(right: 12).expand(),
        '$label'.text.make(),
      ]);
    }

    // DASH
    else if (label != null && dividerMode == ExDividerMode.DASH && textMode == ExDividerTextMode.CENTER) {
      return HStack([
        buildDash().expand(),
        '$label'.text.make().pSymmetric(h: 16),
        buildDash().expand(),
      ]);
    } else if (label != null && dividerMode == ExDividerMode.DASH && textMode == ExDividerTextMode.LEFT) {
      return HStack([
        '$label'.text.make(),
        buildDash().pOnly(left: 16).expand(),
      ]);
    } else if (label != null && dividerMode == ExDividerMode.DASH && textMode == ExDividerTextMode.RIGHT) {
      return HStack([
        buildDash().pOnly(right: 16).expand(),
        '$label'.text.make(),
      ]);
    }

    // // DEFAULT
    else if (dividerMode == ExDividerMode.LINE) {
      return Divider();
    } else if (dividerMode == ExDividerMode.DASH) {
      return buildDash();
    } else {
      return Divider();
    }
  }

  Row buildDash() {
    return Row(
      children: List.generate(
        150 ~/ 2,
        (index) => Expanded(
          child: Container(
            color: index.isOdd ? Colors.transparent : Colors.grey,
            height: 1,
          ),
        ),
      ),
    );
  }
}
