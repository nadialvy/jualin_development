// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';

class ExRestartWidget extends StatefulWidget {
  const ExRestartWidget({required this.child});

  final Widget child;

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_ExRestartWidgetState>()?.restartApp();
  }

  @override
  _ExRestartWidgetState createState() => _ExRestartWidgetState();
}

class _ExRestartWidgetState extends State<ExRestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}
