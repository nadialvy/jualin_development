// ignore_for_file: prefer_const_constructors

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:jualin_flutter_3/app/widgets/index.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/resource/color.dart';
import 'loading_animation/loading_animation_widget.dart';

class ExImageNoCacheView extends StatelessWidget {
  const ExImageNoCacheView(
    this.imageUrl,
    this.headers, {
    Key? key,
  }) : super(key: key);

  final String imageUrl;
  final Map<String, String>? headers;

  Future<Uint8List> getImageBytes() async {
    final response = await get(Uri.parse(imageUrl), headers: headers);
    return response.bodyBytes;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List>(
      future: getImageBytes(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Image.memory(
            snapshot.data!,
            errorBuilder: (context, error, stackTrace) {
              // disediain aja, HARUSNYA tidak akan pernah terjadi.
              return ExImageView(url: 'https://user-images.githubusercontent.com/36602270/174274220-ea090efe-7903-4ec5-a189-63b807fcf35d.jpg');
            },
          ).backgroundColor(colorWhite);
        }
        return Center(
          child: LoadingAnimationWidget.discreteCircle(
            color: colorWhite,
            size: 32,
          ),
        );
      },
    );
  }
}
