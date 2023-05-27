import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mybookstore/core/utils/colors.dart';

class IconButtonWidget extends StatelessWidget {
  final String icon;
  final Function()? onPressed;
  final Color color;
  final Color iconColor;
  const IconButtonWidget(
      {super.key,
      required this.icon,
      this.onPressed,
      this.color = MyBookStoreColors.background,
      this.iconColor = MyBookStoreColors.black});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: IconButton(
          icon: SvgPicture.asset('assets/icons/$icon.svg',
              fit: BoxFit.scaleDown,
              height: 20,
              colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn)),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
