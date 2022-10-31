import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jualin_flutter_3/app/core/resource/color.dart';
import 'app/modules/home/controllers/home_controller.dart';
import 'app/routes/app_pages.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(HomeController()));
  runApp(
    GetMaterialApp(
      // darkTheme: AppThemes.dark,
      // themeMode: AppThemes.theme,
      // theme: AppThemes.light,
      theme: ThemeData(
        primarySwatch: colorPrimary,
        primaryColor: colorPrimary,
        fontFamily: 'PlusJakartaSans'
      ),
      defaultTransition: Transition.native,
      debugShowCheckedModeBanner: false,
      title: "Jualin",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
