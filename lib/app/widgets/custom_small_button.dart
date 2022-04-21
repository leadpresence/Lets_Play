import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSmallButton extends StatelessWidget {
  final onPressed, hasIcon, buttonText, hasBorder;

  final Color buttonColor, buttonTextColor;
  const CustomSmallButton({
    Key? key,
    this.onPressed,
    this.hasIcon = false,
    this.buttonText = "Button Text",
    this.hasBorder = false,
    this.buttonColor = const Color(0xffffffff),
    this.buttonTextColor = const Color(0xff414249),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

    return SizedBox(
      width: screenWidth(context)/2.6,
      height: 48,
      child: Theme(
        data: ThemeData(
          splashColor: Colors.white,
          highlightColor: Colors.white,
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            primary: buttonColor,
            shadowColor: Colors.white,
            onPrimary: Colors.white,
            onSurface: Colors.white,
            elevation: 0,
            // splashFactory: NoSplash.splashFactory,
            shape: RoundedRectangleBorder(
              side: hasBorder
                  ? const BorderSide(color: Color(0xff543884), width: 1)
                  : BorderSide.none,
              borderRadius: BorderRadius.circular(24),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              hasIcon
                  ? SvgPicture.asset(
                'assets/svgs/clarity_shopping-cart-line.svg',
                color: Colors.white,
              )
                  : const SizedBox(),
              hasIcon
                  ? const SizedBox(
                width: 12,
              )
                  : const SizedBox(),
              Text(
                buttonText,
                style: TextStyle(
                  color: buttonTextColor,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
