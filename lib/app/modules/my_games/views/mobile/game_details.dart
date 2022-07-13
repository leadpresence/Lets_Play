import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/my_games_controller.dart';

class GameDetailMobilePortrait extends StatelessWidget {
  final String title, status, numberOfGames, gameCost;
  final List ticketNumber;
  final date;

  GameDetailMobilePortrait({
    Key? key,
    required this.ticketNumber,
    required this.numberOfGames,
    required this.gameCost,
    required this.title,
    required this.status,
    this.date,
  }) : super(key: key);

  final MyGamesController controller = Get.put(MyGamesController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: IconButton(
              splashRadius: 24,
              icon: SvgPicture.asset(
                'assets/svgs/chevronLeft.svg',
                color: const Color(0xff12121D),
              ),
              onPressed: () {
                Get.back();
              },
            ),
          ),
        ),
        body: SafeArea(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              // Text(
              //   title,
              //   style: const TextStyle(
              //     fontSize: 24,
              //     color: Color(0xff414249),
              //   ),
              // ),
              const Gap(
                24,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                padding: const EdgeInsets.all(16.0),
                width: Get.width,
                decoration: BoxDecoration(
                  color: const Color(0XFFFFF7EC),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.f.format(DateTime.parse(date)),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0XFF414249),
                        fontSize: 12,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0XFF414249),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Number of games:',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0XFF414249),
                            fontSize: 14,
                            height: 1.4,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          numberOfGames.toString(),
                          style: GoogleFonts.mulish(
                            color: const Color(0xffFE7A01),
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Selected Numbers:',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0XFF414249),
                            fontSize: 14,
                            height: 1.4,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          children: [
                            for (int i = 0; i < ticketNumber.length; i++)
                              Text(
                                ticketNumber[i].toString(),
                                maxLines: 4,
                                style: GoogleFonts.mulish(
                                  color: const Color(0xffFE7A01),
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                  fontSize: 16,
                                ),
                              ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Cost of Game:',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0XFF414249),
                            fontSize: 14,
                            height: 1.4,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          '₦$gameCost.00',
                          style: GoogleFonts.mulish(
                            color: const Color(0xffFE7A01),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Status:',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0XFF414249),
                            fontSize: 14,
                            height: 1.4,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          status.capitalizeFirst!,
                          style: GoogleFonts.mulish(
                            color: const Color(0xffFE7A01),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ])));
  }
}
