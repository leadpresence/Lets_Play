import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    this.buttonColor = const Color(0xFFFE7A01),
    this.buttonTextColor = const Color(0xffffffff),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34,
      width: Get.width * .22,
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
                  ? const BorderSide(color: Color(0xFFFE7A01), width: 1)
                  : BorderSide.none,
              borderRadius: BorderRadius.circular(8),
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
                  fontSize: 11,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
