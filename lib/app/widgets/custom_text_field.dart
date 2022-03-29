import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextButton extends StatelessWidget {
   const CustomTextButton({
    required this.buttonText,
    this.boxShadowColor,
    required this.onPressed,
    this.buttonColor = const Color(0xffFE7A01),
    this.textColor = Colors.white,
    this.icon = 'assets/svgs/arrow_right.svg',
    this.iconSize = const Size(12, 12),
    this.splashColor = const Color(0xffFE7A01),
    this.buttonText2 = '',
    this.isLoading = false,
    this.fontWeight,
  });

  final dynamic boxShadowColor, onPressed;
  final String buttonText, buttonText2, icon;
  final Color splashColor, textColor, buttonColor;
  final bool isLoading;
  final Size iconSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            height: 48,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                      color: boxShadowColor ?? Colors.black.withOpacity(.2),
                      blurRadius: 10, // soften the shadow
                      spreadRadius: 0, //extend the shadow
                      offset: const Offset(0, 10))
                ]),
            child: ElevatedButton(
              onPressed: isLoading ? () {} : onPressed,
              style: ElevatedButton.styleFrom(
                  shadowColor: Colors.transparent,
                  onPrimary: splashColor,
                  elevation: 0,
                  primary: isLoading ? const Color(0xffFE7A01) : buttonColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0))),
              child: isLoading
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // SizedBox(width: 12),
                        Text('Processing...',
                            style: TextStyle(
                                fontSize: 14,
                                color: textColor,
                                fontWeight: FontWeight.bold,
                                letterSpacing: .5)),
                        const SizedBox(width: 12),
                        const SizedBox(
                          height: 16,
                          width: 16,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 1,
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                          const SizedBox(width: 14),
                          Row(children: [
                            Text(buttonText,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: textColor,
                                    fontWeight: fontWeight ?? FontWeight.bold,
                                    letterSpacing: .5)),
                            Text(buttonText2,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: textColor,
                                    fontWeight: fontWeight ?? FontWeight.bold))
                          ]),
                          SizedBox(
                              height: iconSize.height,
                              width: iconSize.width,
                              child: SvgPicture.asset(icon, color: textColor))
                        ]),
            )));
  }
}
