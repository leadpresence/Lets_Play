import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jekawin_mobile_flutter/app/widgets/slide_in_animation.dart';

import '../config/colors.dart';

class Countdown extends AnimatedWidget {
  Countdown({
    required this.animation,
    required this.onPressed,
  }) : super(
          listenable: animation,
        );
  final Animation<int> animation;
  final void Function() onPressed;

  @override
  build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation.value);
    String timerText =
        '${clockTimer.inMinutes.remainder(60).toString().padLeft(2, '0')}:${clockTimer.inSeconds.remainder(60).toString().padLeft(2, '0')}';
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SlideInAnimation(
          duration: const Duration(milliseconds: 700),
          child: Text(
            timerText == '00:00' ? '' : 'Resend OTP in   ',
            textAlign: TextAlign.center,
            style: GoogleFonts.mulish(
              fontSize: 12,
              color: const Color(0xff12121D).withOpacity(.6),
            ),
          ),
        ),
        SlideInAnimation(
          duration: const Duration(milliseconds: 700),
          child: timerText == '00:00'
              ? InkWell(
                  splashColor: Colors.transparent,
                  onTap: onPressed,
                  child: Text(
                    'Resend',
                    style: GoogleFonts.mulish(
                      fontSize: 12,
                      decoration: TextDecoration.underline,
                      color: purpleDark,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              : Text(
                  timerText,
                  style: GoogleFonts.mulish(
                    fontSize: 12,
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
        ),
      ],
    );
  }
}
