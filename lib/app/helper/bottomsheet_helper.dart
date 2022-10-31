// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gredu_common/gredu_common.dart';

import '../core/resource/color.dart';
import '../widgets/index.dart';
import 'decorator_helper.dart';

enum BSHeaderType { dash, close }

enum BSContentType { regular, radio }

mixin BottomSheetHelper {
  // —————————————————————————————————————————————————————————————————————————
  // BOTTOM SHEET DIALOG  ————————————————————————————————————————————————————
  // —————————————————————————————————————————————————————————————————————————
  static void bottomSheetContentDialog({
    required String title,
    required Widget childrenWidget,
    int titleMaxLine = 999,
    BSHeaderType headerType = BSHeaderType.dash,
    MainAxisAlignment alignment = MainAxisAlignment.spaceBetween,
    bool iconPositionOnLeft = false,
  }) {
    // add haptic feedback (UX)
    HapticFeedback.lightImpact();
    Get.bottomSheet(
      Container(
        decoration: DecoratorHelper.boxBottomSheetRadiusDecoration(),
        child: VStack(
          [
            if (headerType == BSHeaderType.dash)
              VStack([
                const ExDashLine(),
                title.text.bold.size(18).maxLines(titleMaxLine).make().pSymmetric(v: 24),
              ])
            else
              iconPositionOnLeft
                  ? HStack(
                      [
                        const Icon(Icons.close_rounded, size: 30, color: Colors.grey).pOnly(right: 8).onInkTap(() => Get.back()),
                        title.text.color(colorBlack).size(18).maxLines(titleMaxLine).bold.make(),
                      ],
                      alignment: alignment,
                    ).pOnly(bottom: 24)
                  : HStack(
                      [
                        title.text.color(colorBlack).maxLines(titleMaxLine).size(18).bold.make(),
                        IconButton(
                          onPressed: () => Get.back(),
                          icon: const Icon(Icons.close_rounded, size: 30, color: Colors.grey),
                        ),
                      ],
                      alignment: alignment,
                    ).w(double.infinity - 48),
            Wrap(children: [childrenWidget]),
          ],
        ).p24(),
      ),
      elevation: 10,
      isScrollControlled: true,
    );
  }

  static void bottomSheetCustomDialog({
    required Widget childrenWidget,
    double radius = 16,
    bool isClose = false,
    double initialChildSize = 0.7,
    bool isScrollControlled = true,
    double minChildSize = 0.5,
    Function()? onClose,
  }) {
    // add haptic feedback (UX)
    HapticFeedback.lightImpact();
    Get.bottomSheet(
      DraggableScrollableSheet(
        initialChildSize: initialChildSize,
        maxChildSize: 0.9,
        minChildSize: minChildSize,
        builder: (_, controller) => Container(
          decoration: DecoratorHelper.boxBottomSheetRadiusDecoration(radius: radius),
          child: VStack(
            [
              const ExDashLine(),
              if (isClose)
                const Align(alignment: Alignment.centerRight, child: Icon(Icons.close_rounded, size: 25, color: Colors.black)).onInkTap(() => {Get.back(), if (onClose != null) onClose() else ''})
              else
                const SizedBox(),
              ListView(
                controller: controller,
                children: [childrenWidget],
              ).paddingSymmetric(vertical: 24).expand(),
            ],
          ).p24(),
        ),
      ),
      elevation: 10,
      isScrollControlled: isScrollControlled,
      isDismissible: true,
    );
  }

  static void bottomSheetContentDialogWithoutText({required Widget childrenWidget, double radius = 16, bool isClose = false}) {
    // add haptic feedback (UX)
    HapticFeedback.lightImpact();
    Get.bottomSheet(
      Container(
        decoration: DecoratorHelper.boxBottomSheetRadiusDecoration(radius: radius),
        child: VStack(
          [
            Center(
              child: Container(
                width: 30,
                height: 2,
                color: colorNeutral,
              ),
            ),
            if (isClose) const Align(alignment: Alignment.centerRight, child: Icon(Icons.close_rounded, size: 25, color: Colors.black)) else const SizedBox(),
            Wrap(children: [childrenWidget]).pOnly(top: 20),
          ],
        ).p24(),
      ),
      elevation: 10,
      isScrollControlled: true,
    );
  }

  static void bottomSheetListWithSelectedDialog({
    required List<KeyVal> data,
    required String title,
    required String keySelected,
    bool? showTotalData = false,
    bool isFullScreen = false,
    required Function(String, String) callback,
    String? emptyMessage = 'Tidak ada data',
    String? emptySvgAsset,
    Function? emptyCallback,
    double? radius = 16,
  }) {
    // add haptic feedback (UX)
    HapticFeedback.lightImpact();
    final totalData = data.length;
    Get.bottomSheet(
      Container(
        decoration: DecoratorHelper.boxBottomSheetRadiusDecoration(),
        child: VStack(
          [
            const ExDashLine().p24(),
            8.heightBox,
            if (showTotalData == true) '$title ($totalData)'.text.size(18).semiBold.make().paddingOnly(left: 24, right: 24) else title.text.size(18).semiBold.make().paddingOnly(left: 24, right: 24),
            12.heightBox,
            Expanded(
              child: data.isNotEmpty
                  ? ListView.separated(
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: data[index].key == keySelected ? data[index].val.text.bold.size(14).make() : data[index].val.text.size(14).make(),
                          trailing: data[index].key == keySelected ? Icon(Icons.radio_button_on) : Icon(Icons.radio_button_off),
                          onTap: () {
                            Get.back();
                            callback(data[index].key, data[index].val);
                          },
                        ).pSymmetric(h: 24);
                      },
                    )
                  : VStack([
                      100.heightBox,
                      ExUiErrorOrEmpty(
                        title: '$emptyMessage',
                        svgAssets: emptySvgAsset,
                        callback: () => emptyCallback?.call(),
                      ).centered(),
                    ]).scrollVertical(),
            ),
          ],
        ),
      ),
      isScrollControlled: isFullScreen,
    );
  }
}
