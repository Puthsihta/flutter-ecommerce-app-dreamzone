import 'package:dreamzone/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomTextInput extends StatelessWidget {
  final String label;
  final String hintText;
  final bool? enable;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final Icon? prefixIcon;
  final Widget? suffixIcon;
  final bool? obscureText;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final void Function(String)? onSubmitAction;
  final void Function(String)? onChangedText;
  final String? errorMessage;

  const CustomTextInput({
    super.key,
    required this.label,
    this.enable,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    required this.keyboardType,
    this.suffixIcon,
    this.obscureText,
    this.focusNode,
    this.textInputAction,
    this.onSubmitAction,
    this.errorMessage,
    this.onChangedText,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: baseColor, // Highlight color
        ),
      ),
      child: TextField(
        keyboardType: keyboardType,
        enabled: enable,
        controller: controller,
        cursorColor: placeHolderColor,
        obscureText: obscureText ?? false,
        focusNode: focusNode,
        textInputAction: textInputAction,
        onSubmitted: onSubmitAction,
        onChanged: onChangedText,
        style: TextStyle(
          color: titleColor,
          fontSize: 15,
        ),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          labelText: label,
          hintText: hintText,
          errorText: errorMessage == "" ? null : errorMessage,
          labelStyle: const TextStyle(
            color: Colors.grey, // Color when not focused
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.lightBlue,
            ),
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
