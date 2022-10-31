import 'package:flutter/material.dart';

class ExCheckBoxListTile extends StatelessWidget {
  const ExCheckBoxListTile({
    Key? key,
    required this.value,
    required this.title,
    this.subtitle,
    this.fillColor,
    this.radius,
    required this.onChanged,
  }) : super(key: key);

  final Widget title;
  final String? subtitle;
  final bool value;
  final Color? fillColor;
  final double? radius;
  final Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        checkboxTheme: CheckboxThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 4),
          ),
        ),
      ),
      child: CheckboxListTile(
        value: value,
        activeColor: fillColor,
        controlAffinity: ListTileControlAffinity.leading,
        onChanged: (newValue) => onChanged(newValue ?? false),
        title: title,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 4),
        ),
      ),
    );
  }
}
