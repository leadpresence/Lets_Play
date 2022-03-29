import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomButton extends StatelessWidget {
  final onPressed, hasIcon, buttonText;
  const CustomButton({
    Key? key,
    this.onPressed,
    this.hasIcon = false,
    this.buttonText = "Button Text",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: Theme(
        data: ThemeData(
          splashColor: Colors.white,
          highlightColor: Colors.white,
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            primary: const Color(0xFFFE7A01),
            shadowColor: Colors.white,
            onPrimary: Colors.white,
            onSurface: Colors.white,
            elevation: 0,
            // splashFactory: NoSplash.splashFactory,
            shape: RoundedRectangleBorder(
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
              Text(
                buttonText,
                style: const TextStyle(
                  color: Colors.white,
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
