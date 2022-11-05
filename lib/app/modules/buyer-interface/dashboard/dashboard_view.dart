// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<DashboardController>(
        init: DashboardController(),
        initState: (_) {},
        builder: (_) => PersistentTabView(
          context,
          controller: _.bottomNavigationController,
          screens: _.pageList,
          items: _navBarsItems(),
          resizeToAvoidBottomInset: true,
          onItemSelected: (value) => controller.onTabChange(value),
          popAllScreensOnTapOfSelectedTab: false,
          popActionScreens: PopActionScreensType.once,
          itemAnimationProperties: ItemAnimationProperties(duration: 300.milliseconds, curve: Curves.easeIn),
          screenTransitionAnimation: ScreenTransitionAnimation(curve: Curves.easeIn, duration: 300.milliseconds),
          navBarStyle: NavBarStyle.simple,
        ),
      ),
    );
  }
}

List<PersistentBottomNavBarItem> _navBarsItems() => [
      PersistentBottomNavBarItem(
        icon: Image.asset(
          'assets/images/ic_home_active.png',
          scale: 2.5,
        ),
        inactiveIcon: Image.asset(
          'assets/images/ic_home.png',
          scale: 2.5,
        ),
        iconSize: 20,
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset(
          'assets/images/ic_order_active.png',
          scale: 2.5,
        ),
        inactiveIcon: Image.asset(
          'assets/images/ic_order.png',
          scale: 2.5,
        ),
        iconSize: 20,
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset(
          'assets/images/ic_chat_active.png',
          scale: 2.5,
        ),
        inactiveIcon: Image.asset(
          'assets/images/ic_chat.png',
          scale: 2.5,
        ),
        iconSize: 20,
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset(
          'assets/images/ic_setting_active.png',
          scale: 2.5,
        ),
        inactiveIcon: Image.asset(
          'assets/images/ic_setting.png',
          scale: 2.5,
        ),
        iconSize: 20,
      ),
    ];
