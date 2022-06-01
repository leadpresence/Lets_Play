import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class GameDetailMobilePortrait extends StatelessWidget {
  final String ticketNumber, numberOfGames, gameCost;

  const GameDetailMobilePortrait({Key? key,  required this.ticketNumber,
    required this.numberOfGames,
    required this.gameCost,}) : super(key: key);

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

                children:  [
              const Text(
                'My Games',
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xff414249),
                ),
              ),
              const Gap(24,),

              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24.0),
                padding: const EdgeInsets.all(24.0),
                width: Get.width,
                decoration: BoxDecoration(
                  color: const Color(0XFFFFF7EC),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Number of games:',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0XFF414249),
                            fontSize: 16,
                            height: 1.4,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          numberOfGames,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Selected Numbers:',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0XFF414249),
                            fontSize: 16,
                            height: 1.4,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          ticketNumber,
                          maxLines: 4,
                          style: GoogleFonts.mulish(
                            color: const Color(0xffFE7A01),
                            fontWeight: FontWeight.bold,
                            letterSpacing: 4,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        const Text(
                          'Cost of Game:',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0XFF414249),
                            fontSize: 16,
                            height: 1.4,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          '₦$gameCost',
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
