import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

///   created               : Aditya Pratama
///   originalFilename      : ex_ui_loading
///   date                  : 24 Jun 2021
///   —————————————————————————————————————————————————————————————————————————————
///

class ExUiShimmerList extends StatelessWidget {
  const ExUiShimmerList({Key? key, this.count = 10}) : super(key: key);

  final int? count;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: context.mq.size.height,
      width: context.mq.size.width,
      child: ZStack([
        Column(
          children: List.generate(count!, (index) {
            return buildCC(context);
          }),
        ).scrollVertical(),
        // VStack([
        //   LoadingAnimationWidget.discreteCircle(color: Colors.blueGrey, size: 24).centered(),
        //   8.heightBox,
        //   'asdkfhjkafhka'.text.size(12).makeCentered(),
        // ]).centered(),
      ]),
    );
  }

  Widget buildCC(BuildContext context) {
    final primaryColor = Colors.grey[200]!;
    final secondaryColor = Colors.grey[300]!;

    return SizedBox(
      width: double.infinity,
      child: HStack([
        VxCircle().wh(50, 50).shimmer(primaryColor: primaryColor, secondaryColor: secondaryColor),
        12.widthBox,
        VStack([
          Container(width: 250, height: 12, color: primaryColor).cornerRadius(2).shimmer(primaryColor: primaryColor, secondaryColor: secondaryColor),
          4.heightBox,
          Container(width: 150, height: 10, color: primaryColor).cornerRadius(2).shimmer(primaryColor: primaryColor, secondaryColor: secondaryColor),
          4.heightBox,
          HStack([
            Container(height: 10, color: primaryColor).cornerRadius(2).shimmer(primaryColor: primaryColor, secondaryColor: secondaryColor).expand(),
            12.widthBox,
            Container(height: 10, color: primaryColor).cornerRadius(2).shimmer(primaryColor: primaryColor, secondaryColor: secondaryColor).expand(flex: 7),
            12.widthBox,
            Container(height: 10, color: primaryColor).cornerRadius(2).shimmer(primaryColor: primaryColor, secondaryColor: secondaryColor).expand(flex: 2),
          ]),
        ]).expand(),
        VxCircle().wh(12, 12).shimmer(primaryColor: primaryColor, secondaryColor: secondaryColor),
      ]).p8(),
    ).card.make();
  }
}
