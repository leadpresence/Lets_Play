import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jekawin_mobile_flutter/app/config/colors.dart';
import 'package:flutter_svg/svg.dart';

screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

purpleLageButton(String text, Function onpressed, BuildContext context) =>
    SizedBox(
      width: (screenWidth(context) * 0.91),
      child: CupertinoButton(
        color: purple,
        pressedOpacity: 0.6,
        child: Text(
          text,
          style: const TextStyle(color: white),
        ),
        onPressed: () => {onpressed},
      ),
    );

orangeLageButton(String text, VoidCallback onpressed, BuildContext context) =>
    SizedBox(
      width: (screenWidth(context) * 0.91),
      child: CupertinoButton(
        color: orange,
        pressedOpacity: 0.6,
        child: Text(
          text,
          style: const TextStyle(color: white),
        ),
        onPressed: () => onpressed,
      ),
    );

borderLageButton(String text, Function onpressed, BuildContext context) =>
    SizedBox(
      width: (screenWidth(context) * 0.91),
      child: OutlinedButton(
        child: Text(
          text,
          style: const TextStyle(color: purple),
        ),
        onPressed: () => {onpressed},
      ),
    );

class CustomButton extends StatelessWidget {
  final onPressed, hasIcon, buttonText, hasBorder, height, isLoading;

  final Color buttonColor, buttonTextColor, borderColor;
  const CustomButton({
    Key? key,
    this.onPressed,
    this.hasIcon = false,
    this.buttonText = "Button Text",
    this.hasBorder = false,
    this.buttonColor = const Color(0xFFFE7A01),
    this.buttonTextColor = const Color(0xffffffff),
    this.height,
    this.isLoading = false,
    this.borderColor = const Color(0xff543884),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 52,
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
            splashFactory: NoSplash.splashFactory,
            shape: RoundedRectangleBorder(
              side: hasBorder
                  ? BorderSide(color: borderColor, width: 1)
                  : BorderSide.none,
              borderRadius: BorderRadius.circular(16),
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
                      style: GoogleFonts.mulish(
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
