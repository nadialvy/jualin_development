import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

///   created               : Aditya Pratama
///   originalFilename      : ex_progress
///   date                  : 24 Jun 2021
///   —————————————————————————————————————————————————————————————————————————————
///   <img width="369" alt="image" src="https://user-images.githubusercontent.com/36602270/169626718-b998853b-1837-44e4-8f2a-1561619f1087.png">

class ExProgress extends StatelessWidget {
  const ExProgress({
    Key? key,
    required this.value,
    this.height,
    required this.color1,
    required this.color2,
  }) : super(key: key);

  final int value;
  final double? height;
  final Color color1;
  final Color color2;

  @override
  Widget build(BuildContext context) {
    final rest = 100 - value;
    return Directionality(
      textDirection: TextDirection.ltr,
      child: MediaQuery(
        data: const MediaQueryData(),
        child: Stack(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 100,
                  child: Container(
                    height: height ?? 12,
                    color: color2,
                  ).cornerRadius(20),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: value,
                  child: Container(
                    width: 200,
                    height: height ?? 12,
                    color: color1,
                  ).cornerRadius(20),
                ),
                Expanded(
                  flex: rest,
                  child: Container(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
