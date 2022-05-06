import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import '../../../../widgets/custom_large_button.dart';
import 'jackpot_games_details_mobile_portrait.dart';

class JackpotGamesMobilePortrait extends StatelessWidget {
  const JackpotGamesMobilePortrait({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: IconButton(
              splashRadius: 25,
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
              const Text(
                'Jackpot Games',
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xff414249),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24.0),
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 20,
                    left: 20,
                    right: 20,
                  ),
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: const Color(0XFF9A77CF),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: SvgPicture.asset(
                          'assets/svgs/note_that.svg',
                          color: const Color(0XFFFFFFFF),
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Text(
                          'Select 5 numbers from a range of 0- 50 or auto generate the numbers',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0XFFFFFFFF),
                              fontSize: 16,
                              height: 1.4),
                        ),
                      )
                    ],
                  )),
              const SizedBox(
                height: 24,
              ),
              Expanded(
                child: SizedBox(
                  width: Get.width,
                  child: Column(
                    children: [
                      TabBar(
                        isScrollable: false,
                        labelColor: const Color(0XFFFE7A01),
                        indicatorColor: const Color(0XFFFE7A01),
                        labelStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                        unselectedLabelColor: const Color(0XFF414249),
                        unselectedLabelStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                        labelPadding:
                            const EdgeInsets.symmetric(vertical: 18.0),
                        automaticIndicatorColorAdjustment: true,
                        tabs: [
                          Text('Single Ticket'.toUpperCase()),
                          Text('Multi Ticket'.toUpperCase()),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(children: [
                          Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Cost : ₦50',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0XFF543884),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 6,
                                          horizontal: 12,
                                        ),
                                        primary: const Color(0XFFfFF7EC),
                                        shadowColor: Colors.transparent,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: const Text(
                                        'Generate all',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0XFFFE7A01),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 24),
                                Pinput(
                                  length: 5,
                                  key: key,
                                  defaultPinTheme: PinTheme(
                                    width: 56,
                                    height: 56,
                                    textStyle: GoogleFonts.poppins(
                                      fontSize: 16,
                                      color: const Color(0XFF414249),
                                      fontWeight: FontWeight.bold,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(
                                        color: const Color(0XFFDADEE3),
                                        width: 3,
                                      ),
                                    ),
                                  ),
                                  focusedPinTheme: PinTheme(
                                    width: 56,
                                    height: 56,
                                    textStyle: GoogleFonts.poppins(
                                      fontSize: 16,
                                      color: const Color(0XFF414249),
                                      fontWeight: FontWeight.bold,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(
                                        color: const Color(0XFFFE7A01),
                                        width: 3,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 32,
                                ),
                                CustomButton(
                                  buttonText: "Confirm",
                                  onPressed: () => Get.to(
                                    () => const JackpotGamesDetailsMobilePortrait(),
                                    transition: Transition.cupertino,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Cost : ₦200',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0XFF543884),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 6,
                                          horizontal: 12,
                                        ),
                                        primary: const Color(0XFFfFF7EC),
                                        shadowColor: Colors.transparent,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: const Text(
                                        'Generate all',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0XFFFE7A01),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
