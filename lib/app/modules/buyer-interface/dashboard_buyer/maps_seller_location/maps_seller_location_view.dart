import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jualin_flutter_3/app/core/resource/color.dart';
import 'package:velocity_x/velocity_x.dart';

import 'maps_seller_location_controller.dart';

class MapsSellerLocationView extends GetView<MapsSellerLocationController> {
  const MapsSellerLocationView({super.key});

  static const double defLat = -7.2823185;
  static const double defLong = 112.7931503;

  static const CameraPosition defLocation = CameraPosition(target: LatLng(defLat, defLong), zoom: 15);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: 'Lokasi Pedagang di Sekitar Anda'.text.color(colorBlack).size(14).bold.make(),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            leading: const Icon(
              Icons.arrow_back,
              color: colorBlack,
            ).onTap(() => Get.back())),
        body: Stack(
          children: [
            GoogleMap(initialCameraPosition: defLocation),
            Container(
              padding: const EdgeInsets.only(top: 24, right: 12),
              alignment: Alignment.topRight,
              child: VStack([]),
            )
          ],
        ));
  }
}
