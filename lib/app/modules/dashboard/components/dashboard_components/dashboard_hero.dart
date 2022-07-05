import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../widgets/custom_medium_button.dart';

class DashboardHeroSession extends StatelessWidget {
  final Animation<int> animation;
  final void Function() onPressed;
  final title, priceToBeWon;
  const DashboardHeroSession({
    Key? key,
    required this.animation,
    required this.onPressed,
    this.title,
    this.priceToBeWon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation.value);
    RxString seconds =
            clockTimer.inSeconds.remainder(60).toString().padLeft(2, '0').obs,
        minutes =
            clockTimer.inMinutes.remainder(60).toString().padLeft(2, '0').obs,
        hours = clockTimer.inHours.remainder(60).toString().padLeft(2, '0').obs,
        days = clockTimer.inDays.remainder(7).toString().padLeft(2, '0').obs;
    return Obx(
      () => SizedBox(
        height: 360,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Image.asset('assets/svgs/home_dashboard_card.png'),
            Image.asset('assets/svgs/home_dashboard_frame.png'),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                children: [
                  SvgPicture.asset('assets/svgs/white_logo.svg'),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    title.toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    '₦${priceToBeWon.toString()}',
                    style: GoogleFonts.lemon(
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 44,
                  ),
                  const Text(
                    'TIME LEFT TO NEXT DRAW',
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
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
                        index1: days.value[0],
                        index2: days.value[1],
                        type: 'Days',
                      ),
                      textWidget(':', padding: 6.0),
                      singleTime(
                        index1: hours.value[0],
                        index2: hours.value[1],
                        type: 'Hours',
                      ),
                      textWidget(':', padding: 6.0),
                      singleTime(
                        index1: minutes.value[0],
                        index2: minutes.value[1],
                        type: 'Minutes',
                      ),
                      textWidget(':', padding: 6.0),
                      singleTime(
                        index1: seconds.value[0],
                        index2: seconds.value[1],
                        type: 'Seconds',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomMediumButton(
                onPressed: onPressed,
                buttonText: 'Play Now',
                buttonColor: const Color(0xFFFE7A01),
              ),
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
