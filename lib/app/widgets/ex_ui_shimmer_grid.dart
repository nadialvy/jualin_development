import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

///   created               : Aditya Pratama
///   originalFilename      : ex_ui_loading
///   date                  : 24 Jun 2021
///   —————————————————————————————————————————————————————————————————————————————
///

class ExUiShimmerGrid extends StatelessWidget {
  const ExUiShimmerGrid({Key? key, this.count = 10}) : super(key: key);

  final int? count;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: context.mq.size.height,
      width: context.mq.size.width,
      child: GridView.count(
        crossAxisCount: 2,
        children: List.generate(count!, (index) {
          return Center(
            child: buildCC(context),
          );
        }),
      ),
    );
  }

  Widget buildCC(BuildContext context) {
    final primaryColor = Colors.grey[200]!;
    final secondaryColor = Colors.grey[300]!;

    return Container(
      child: VStack(
        [
          HStack([
            const Spacer(),
            Container(width: 24, height: 12, color: primaryColor).cornerRadius(2).shimmer(primaryColor: primaryColor, secondaryColor: secondaryColor),
          ]),
          HStack([
            VxCircle().wh(10, 10).shimmer(primaryColor: primaryColor, secondaryColor: secondaryColor),
            VxCircle().wh(80, 80).shimmer(primaryColor: primaryColor, secondaryColor: secondaryColor).expand(),
            VxCircle().wh(10, 10).shimmer(primaryColor: primaryColor, secondaryColor: secondaryColor),
          ]),
          12.heightBox,
          Container(width: 160, height: 12, color: primaryColor).cornerRadius(2).shimmer(primaryColor: primaryColor, secondaryColor: secondaryColor),
          4.heightBox,
          Container(width: 70, height: 12, color: primaryColor).cornerRadius(2).shimmer(primaryColor: primaryColor, secondaryColor: secondaryColor),
          4.heightBox,
          Container(width: 40, height: 12, color: primaryColor).cornerRadius(2).shimmer(primaryColor: primaryColor, secondaryColor: secondaryColor),
        ],
        alignment: MainAxisAlignment.center,
      ).p12(),
    ).card.make().p8();
  }
}
