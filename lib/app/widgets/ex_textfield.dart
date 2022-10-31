// ignore_for_file: library_private_types_in_public_api, prefer_null_aware_method_calls

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum ExTextFieldBorderType { none, roundLine, underLine }

/// An easy to use implementation of [TextField] with ready to use props.
class ExBaseTextField extends StatefulWidget {
  const ExBaseTextField({
    Key? key,
    this.controller,
    this.hint,
    this.value,
    this.clear = true,
    this.isPassword = false,
    this.obscureText = false,
    this.borderType = ExTextFieldBorderType.underLine,
    this.maxLine = 1,
    this.maxLength,
    this.textAlign = TextAlign.left,
    this.fillColor,
    this.borderColor,
    this.prefixIcon,
    this.suffixIcon,
    this.height = 40,
    this.icon,
    this.borderRadius,
    this.contentPaddingLeft,
    this.contentPaddingTop,
    this.keyboardType,
    this.textInputAction,
    this.inputFormatters,
    this.onChanged,
    this.onSubmitted,
    this.onEditingComplete,
    this.focusNode,
    this.counterText,
    this.autofocus = false,
    this.style,
    this.labelText,
    this.labelStyle,
    this.cursorColor,
    this.autocorrect = true,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorWidth = 2.0,
    this.enableSuggestions = true,
    this.enabled,
    this.showCursor,
    this.toolbarOptions,
    this.onSaved,
    this.validator,
    this.autovalidateMode,
    this.borderColorFocus,
    this.initialValue,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? hint;
  final String? value;
  final bool clear;
  final bool isPassword;
  final bool obscureText;
  final ExTextFieldBorderType borderType;
  final int? maxLine;
  final int? maxLength;
  final TextAlign textAlign;
  final Color? fillColor;
  final Color? borderColor;
  final Color? borderColorFocus;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double height;
  final Widget? icon;
  final double? borderRadius;
  final double? contentPaddingLeft;
  final double? contentPaddingTop;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onEditingComplete;
  final FocusNode? focusNode;
  final String? counterText;
  final bool autofocus;
  final TextStyle? style;
  final String? labelText;
  final TextStyle? labelStyle;
  final Color? cursorColor;
  final bool autocorrect;
  final double? cursorHeight;
  final double cursorWidth;
  final Radius? cursorRadius;
  final bool enableSuggestions;
  final bool? enabled;
  final bool? showCursor;
  final ToolbarOptions? toolbarOptions;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final String? initialValue;

  @override
  _ExBaseTextFieldState createState() => _ExBaseTextFieldState();
}

class _ExBaseTextFieldState extends State<ExBaseTextField> {
  TextEditingController? controller;
  bool obscureText = false;
  FocusNode? focusNode;

  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? TextEditingController(text: widget.value);
    obscureText = widget.obscureText;
    focusNode = widget.focusNode ?? FocusNode();
    focusNode!.addListener(notify);
  }

  @override
  Widget build(BuildContext context) {
    final Widget textField = TextFormField(
      key: widget.key,
      controller: controller,
      obscureText: obscureText,
      textAlign: widget.textAlign,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      focusNode: focusNode,
      autofocus: widget.autofocus,
      cursorColor: widget.cursorColor,
      autocorrect: widget.autocorrect,
      cursorHeight: widget.cursorHeight,
      cursorRadius: widget.cursorRadius,
      cursorWidth: widget.cursorWidth,
      enableSuggestions: widget.enableSuggestions,
      enabled: widget.enabled,
      showCursor: widget.showCursor,
      toolbarOptions: widget.toolbarOptions,
      inputFormatters: widget.inputFormatters,
      autovalidateMode: widget.autovalidateMode,
      decoration: InputDecoration(
        icon: widget.icon,
        prefixIcon: widget.prefixIcon,
        suffixIcon: suffixView(),
        hintText: widget.hint,
        fillColor: widget.fillColor,
        counterText: widget.counterText,
        filled: true,
        labelText: widget.labelText,
        labelStyle: widget.labelStyle,
        contentPadding: getContentPadding(),
        border: getInputBorder(),
        enabledBorder: getInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: widget.borderColorFocus ?? Theme.of(context).primaryColor, width: 2.0),
          borderRadius: BorderRadius.circular(getBorderRadius()),
        ),
      ),
      maxLength: widget.maxLength,
      maxLines: widget.maxLine,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onSubmitted,
      onSaved: widget.onSaved,
      validator: widget.validator,
      style: widget.style,
      initialValue: widget.initialValue,
    );

    const other = null;
    if (widget.maxLine == other && widget.borderType == ExTextFieldBorderType.roundLine) {
      return Container(
        decoration: getBoxDecoration(),
        constraints: BoxConstraints(minHeight: widget.height),
        child: textField,
      );
    }

    return textField;
  }

  /// Suffix widget to show
  Widget? suffixView() {
    final children = <Widget>[];
    final tempValue = controller!.text;
    final double tempSize = math.min(widget.height / 2, 24);

    // Clear Button
    if (widget.clear && focusNode!.hasFocus && (tempValue.isNotEmpty)) {
      children.add(
        GestureDetector(
          onTap: clear,
          child: Icon(Icons.clear, size: tempSize),
        ),
      );
    }

    // Has Suffix Icon
    if (widget.suffixIcon != null) {
      if (children.isNotEmpty) {
        children.add(const SizedBox(width: 8));
      }
      children.add(widget.suffixIcon!);
    }

    // Password Button
    if (widget.isPassword) {
      if (children.isNotEmpty) {
        children.add(const SizedBox(width: 8));
      }
      children.add(
        GestureDetector(
          onTap: togglePwd,
          child: Icon(
            obscureText ? Icons.visibility : Icons.visibility_off,
            size: tempSize,
          ),
        ),
      );
    }

    if (children.isNotEmpty) {
      if (widget.borderType == ExTextFieldBorderType.roundLine) {
        children.add(const SizedBox(width: 8));
      }
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: children,
      );
    }
    return null;
  }

  /// Content spacing
  EdgeInsetsGeometry getContentPadding() {
    var contentPaddingLeft = 8.0;
    if (widget.prefixIcon == null) {
      if (widget.borderType == ExTextFieldBorderType.roundLine) {
        contentPaddingLeft = getBorderRadius();
      } else {
        contentPaddingLeft = 0.0;
      }
    }
    return EdgeInsets.only(
      left: widget.contentPaddingLeft ?? contentPaddingLeft,
      right: 8,
      top: widget.contentPaddingTop ?? (widget.height - 20) / 2,
      bottom: (widget.height - 20) / 2,
    );
  }

  /// Radius to the corner
  double getBorderRadius() {
    return widget.borderRadius ?? (widget.height + 10) / 2;
  }

  /// Non-filled decoration

  InputBorder? getInputBorder() {
    final tempColor = widget.borderColor ?? Theme.of(context).primaryColor;
    if (widget.borderType == ExTextFieldBorderType.none) {
      return InputBorder.none;
    } else if (widget.borderType == ExTextFieldBorderType.roundLine) {
      if (widget.maxLine == null) {
        return OutlineInputBorder(
          gapPadding: 0,
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(getBorderRadius()),
        );
      } else {
        return OutlineInputBorder(
          gapPadding: 0,
          borderSide: BorderSide(color: tempColor),
          borderRadius: BorderRadius.circular(getBorderRadius()),
        );
      }
    } else if (widget.borderType == ExTextFieldBorderType.underLine) {
      return UnderlineInputBorder(borderSide: BorderSide(color: tempColor));
    }
    return null;
  }

  /// Fill decoration

  BoxDecoration? getBoxDecoration() {
    final tempColor = widget.borderColor ?? Theme.of(context).primaryColor;
    if (widget.borderType == ExTextFieldBorderType.roundLine) {
      return BoxDecoration(
        color: widget.fillColor,
        border: Border.all(color: tempColor),
        borderRadius: BorderRadius.circular(getBorderRadius()),
      );
    }
    return null;
  }

  /// Clear the controller value
  void clear() {
    controller?.clear();
    onChanged('');
  }

  /// Toggling the password
  void togglePwd() {
    obscureText = !obscureText;
    setState(() {});
  }

  /// when change in the textfield
  void onChanged(String value) {
    notify();
    if (widget.onChanged != null) {
      widget.onChanged!(value);
    }
  }

  /// After the completion of editing
  void onEditingComplete() {
    FocusScope.of(context).unfocus();
    if (widget.onEditingComplete != null) {
      widget.onEditingComplete!();
    }
  }

  /// After submitting the textfield
  void onSubmitted(String value) {
    FocusScope.of(context).unfocus();
    if (widget.onSubmitted != null) {
      widget.onSubmitted!(value);
    }
  }

  /// Updating the view
  void notify() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      controller?.dispose();
    }
    focusNode?.dispose();
    super.dispose();
  }
}
