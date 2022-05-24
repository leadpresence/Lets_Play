import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TimeLeft extends StatelessWidget {
  final Animation<int> animation;
  final void Function() onPressed;
  const TimeLeft({
    Key? key,
    required this.animation,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation.value);
    String seconds =
            clockTimer.inSeconds.remainder(60).toString().padLeft(2, '0'),
        minutes = clockTimer.inMinutes.remainder(60).toString().padLeft(2, '0'),
        hours = clockTimer.inHours.remainder(60).toString().padLeft(2, '0'),
        days = clockTimer.inDays.remainder(7).toString().padLeft(2, '0');
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            const Text(
              'TIME LEFT TO NEXT DRAW',
              style: TextStyle(
                fontSize: 8,
                letterSpacing: .2,
                fontWeight: FontWeight.normal,
                color: Color(0xff414249),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                singleTime(
                  index1: days[0],
                  index2: days[1],
                  type: '',
                ),
                textWidget(':', padding: 6.0),
                singleTime(
                  index1: hours[0],
                  index2: hours[1],
                  type: '',
                ),
                textWidget(':', padding: 6.0),
                singleTime(
                  index1: minutes[0],
                  index2: minutes[1],
                  type: '',
                ),
                textWidget(':', padding: 6.0),
                singleTime(
                  index1: seconds[0],
                  index2: seconds[1],
                  type: '',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget textWidget(text, {padding = 0.0}) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Text(
        text,
        style: GoogleFonts.mulish(
          fontWeight: FontWeight.bold,
          fontSize: 22,
          color: const Color(0XFF262254),
        ),
      ),
    );
  }

  Widget timeBox(text) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 1.4),
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
          color: const Color(0XFFFFF4ED),
          borderRadius: BorderRadius.circular(6)),
      child: textWidget(text),
    );
  }

  Widget singleTime({index1, index2, type}) {
    return Column(
      children: [
        Row(
          children: [
            timeBox(index1),
            timeBox(index2),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          type.toUpperCase(),
          style: const TextStyle(
            color: Color(0XFF414249),
            fontSize: 7,
            fontWeight: FontWeight.bold,
            letterSpacing: .4,
          ),
        )
      ],
    );
  }
}
