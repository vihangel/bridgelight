import 'package:flutter/material.dart';
import 'package:mybookstore/core/utils/texts.dart';

class TextFieldLabel extends StatelessWidget {
  final String? label;
  final TextEditingController? controller;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? width;
  final FormFieldValidator<String>? validator;
  final Function(String)? onChanged;
  final Function()? onEditingComplete;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final AutovalidateMode? autovalidateMode;
  final Function()? onTap;
  final bool enabled;
  final bool readOnly;

  const TextFieldLabel(
      {super.key,
      this.label,
      this.controller,
      this.padding,
      this.margin,
      this.width,
      this.validator,
      this.onChanged,
      this.onEditingComplete,
      this.keyboardType,
      this.focusNode,
      this.autovalidateMode,
      this.enabled = true,
      this.readOnly = false,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      width: width ?? double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('$label', style: MyBookStoreTextStyles.labelMedium),
          const SizedBox(height: 8),
          TextFormField(
            readOnly: readOnly,
            onTap: onTap,
            enabled: enabled,
            controller: controller,
            validator: validator,
            onChanged: onChanged,
            onEditingComplete: onEditingComplete,
            keyboardType: keyboardType,
            focusNode: focusNode,
            autovalidateMode: autovalidateMode,
          ),
        ],
      ),
    );
  }
}
