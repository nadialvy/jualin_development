import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'ex_textfield.dart';

///   created               : Aditya Pratama
///   originalFilename      : ex_text_field_icon
///   date                  : 24 Jun 2021
///   —————————————————————————————————————————————————————————————————————————————
///   <img width="349" alt="image" src="https://user-images.githubusercontent.com/36602270/169626756-7bbcb4f5-f819-4e4b-bd26-fc54c5894ce4.png">

class ExTextFieldIcon extends StatelessWidget {
  const ExTextFieldIcon({
    Key? key,
    this.prefixIcon,
    this.suffixIcon,
    this.borderColor = const Color(0xFFe4e8eb),
    this.hint,
    this.tfController,
    this.isPassword,
    this.obscureText,
    this.onChanged,
    this.onSubmitted,
    this.onEditingComplete,
    this.enabled,
    this.fillColor = Colors.transparent,
    this.iconColor,
    this.textInputType,
    this.textInputAction,
    this.validator,
    this.autoCorrect = false,
    this.autoFocus = false,
    this.clear = true,
    this.initialValue,
    this.labelText,
    this.labelTextColor = Colors.grey,
    this.helperText,
    this.helperTextColor = Colors.grey,
  }) : super(key: key);

  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Color? iconColor;
  final Color? borderColor;
  final String? hint;
  final TextEditingController? tfController;
  final bool? isPassword;
  final bool? obscureText;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onEditingComplete;
  final bool? enabled;
  final Color? fillColor;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final bool autoCorrect;
  final bool autoFocus;
  final bool clear;
  final String? initialValue;
  final String? labelText;
  final Color labelTextColor;
  final String? helperText;
  final Color helperTextColor;

  @override
  Widget build(BuildContext context) {
    return VStack(
      [
        if (labelText != null) labelText!.text.caption(context).color(labelTextColor).make().pOnly(bottom: 8),
        ExBaseTextField(
          borderType: ExTextFieldBorderType.roundLine,
          borderRadius: 4,
          borderColor: borderColor,
          prefixIcon: prefixIcon != null
              ? HStack([
                  16.widthBox,
                  Icon(prefixIcon, size: 20, color: iconColor),
                  12.widthBox,
                  Container(color: borderColor, height: 40, width: 1),
                  16.widthBox,
                ])
              : null,
          contentPaddingLeft: prefixIcon != null ? 0 : 16,
          suffixIcon: suffixIcon != null ? Icon(suffixIcon, size: 20, color: iconColor) : null,
          keyboardType: textInputType,
          textInputAction: textInputAction,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          onEditingComplete: onEditingComplete,
          hint: hint,
          enabled: enabled ?? true,
          controller: tfController,
          isPassword: isPassword ?? false,
          obscureText: obscureText ?? false,
          fillColor: fillColor,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          borderColorFocus: Theme.of(context).primaryColor,
          autocorrect: autoCorrect,
          autofocus: autoFocus,
          clear: clear,
          initialValue: initialValue,
        ),
        if (helperText != null) helperText!.text.caption(context).color(helperTextColor).make().pOnly(top: 8),
      ],
    );
  }
}
