import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/colors.dart';

class CustomMediumButton extends StatelessWidget {
  final onPressed,
      hasIcon,
      buttonText,
      hasBorder,
      itsBorderRadius,
      width,
      fontSize,
      icon,
      isLoading;

  final Color buttonColor, buttonTextColor, borderColor, iconColor;

  const CustomMediumButton({
    Key? key,
    this.onPressed,
    this.hasIcon = false,
    this.buttonText = "Button Text",
    this.hasBorder = false,
    this.itsBorderRadius,
    this.isLoading = false,
    this.buttonColor = const Color(0xFFFE7A01),
    this.iconColor = const Color(0xffff543884),
    this.buttonTextColor = const Color(0xffffffff),
    this.width,
    this.icon,
    this.borderColor = const Color(0xffffffff),
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      width: width ?? Get.width * .6,
      child: Theme(
        data: ThemeData(
          splashColor: Colors.white,
          highlightColor: Colors.white,
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            primary: buttonColor,
            shadowColor: Colors.transparent,
            onPrimary: const Color(0xFFFE7A01).withOpacity(.1),
            onSurface: Colors.white,
            elevation: 0,
            // splashFactory: NoSplash.splashFactory,
            shape: RoundedRectangleBorder(
              side: hasBorder
                  ? BorderSide(color: borderColor, width: 1)
                  : BorderSide.none,
              borderRadius: BorderRadius.circular(itsBorderRadius??36.0),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              hasIcon
                  ? SvgPicture.asset(
                      icon ?? 'assets/svgs/clarity_shopping-cart-line.svg',
                      color: iconColor,
                    )
                  : const SizedBox(),
              hasIcon
                  ? const SizedBox(
                      width: 12,
                    )
                  : const SizedBox(),
              isLoading
                  ? const SizedBox(
                      height: 16,
                      width: 16,
                      child: CircularProgressIndicator(
                        color: white,
                        strokeWidth: 1.5,
                      ),
                    )
                  : Text(
                      buttonText,
                      style: TextStyle(
                          color: buttonTextColor,
                          fontWeight: FontWeight.bold,
                          fontSize: fontSize ?? 14,
                          overflow: TextOverflow.fade),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
