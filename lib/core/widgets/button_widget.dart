import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mybookstore/core/utils/colors.dart';
import 'package:mybookstore/core/utils/texts.dart';

class Button extends StatelessWidget {
  final Widget? child;
  final String? title;
  final VoidCallback? onPressed;
  final bool? enabled;
  final bool loading;
  final Color? background;
  final Color? textColor;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? width;
  final Border? border;

  const Button(
      {super.key,
      this.child,
      this.title,
      this.onPressed,
      this.enabled,
      this.loading = false,
      this.background = MyBookStoreColors.black,
      this.textColor = MyBookStoreColors.white,
      this.borderRadius,
      this.padding,
      this.margin,
      this.width,
      this.border});
  const Button.contrast(
      {super.key,
      this.child,
      this.title,
      this.onPressed,
      this.enabled,
      this.loading = false,
      this.background = MyBookStoreColors.primarySubtitle,
      this.textColor = MyBookStoreColors.black,
      this.borderRadius,
      this.padding,
      this.margin,
      this.width,
      this.border});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width ?? double.maxFinite,
        padding: padding ?? const EdgeInsets.all(16),
        margin: margin,
        decoration: BoxDecoration(
          color: background,
          borderRadius:
              borderRadius ?? const BorderRadius.all(Radius.circular(16)),
          border: border ??
              Border.all(color: MyBookStoreColors.background, width: 1),
        ),
        child: loading
            ? SpinKitThreeBounce(
                color: textColor,
                size: 20,
              )
            : child ??
                Text(
                  title ?? '',
                  style: MyBookStoreTextStyles.labelLarge
                      .copyWith(color: textColor),
                  textAlign: TextAlign.center,
                ),
      ),
    );
  }
}
