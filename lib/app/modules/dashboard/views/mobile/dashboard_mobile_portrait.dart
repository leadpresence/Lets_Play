import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jekawin_mobile_flutter/app/modules/login/views/mobile/login_mobile_portrait.dart';
import 'package:jekawin_mobile_flutter/app/modules/signup/views/mobile/sign_up_mobile_potrait.dart';
import 'package:jekawin_mobile_flutter/app/widgets/custom_large_button.dart';
import 'package:jekawin_mobile_flutter/app/widgets/custom_small_button.dart';

import '../../../../widgets/custom_medium_button.dart';

class DashboardMobilePortrait extends StatelessWidget {
  const DashboardMobilePortrait({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 24.0,
                  right: 24.0,
                  top: 24.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset('assets/svgs/user_icon.svg'),
                        const SizedBox(
                          width: 6,
                        ),
                        const Text('Guest User'),
                      ],
                    ),
                    Row(
                      children: [
                        CustomSmallButton(
                          onPressed: () => Get.to(() => SignupMobilePortrait()),
                          buttonText: 'Sign up',
                          buttonColor: const Color(0xFFFE7A01),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        CustomSmallButton(
                          onPressed: () =>
                              Get.to(() => const LoginMobilePortrait()),
                          buttonColor: Colors.white,
                          hasBorder: true,
                          buttonText: 'Login',
                          buttonTextColor: const Color(0xFFFE7A01),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                height: 364,
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
                          const Text(
                            'Weekly Jackpot',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            '₦100,000',
                            style: GoogleFonts.lemon(
                              fontSize: 38,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 42,
                          ),
                          const Text(
                            'TIME LEFT TO NEXT DRAW',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff414249),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Image.asset(
                            'assets/svgs/countdown.png',
                            width: Get.width * .74,
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: CustomMediumButton(
                        onPressed: () {},
                        buttonText: 'Play Now',
                        buttonColor: const Color(0xFFFE7A01),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Instant Wins',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff414249),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 24,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xff262254),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      width: 94,
                                      height: 34,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: const Color(0xff9A77CF),
                                      ),
                                      child: const Text(
                                        'Spin & Win',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                            'assets/svgs/akar_icon_coin.svg'),
                                        const Text(
                                          ' 50',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFFFE7A01),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Image.asset('assets/svgs/roll_dice.png'),
                              const SizedBox(
                                height: 12,
                              ),
                              CustomButton(
                                height: 48.0,
                                onPressed: () {},
                                buttonText: 'Play Now',
                                buttonColor: const Color(0xFFFE7A01),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 24,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xff262254),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      width: 94,
                                      height: 34,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: const Color(0xff9A77CF),
                                      ),
                                      child: const Text(
                                        'Spin & Win',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                            'assets/svgs/akar_icon_coin.svg'),
                                        const Text(
                                          ' 50',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFFFE7A01),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Image.asset('assets/svgs/roll_dice.png'),
                              const SizedBox(
                                height: 12,
                              ),
                              CustomButton(
                                height: 48.0,
                                onPressed: () {},
                                buttonText: 'Play Now',
                                buttonColor: const Color(0xFFFE7A01),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 24,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xff262254),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      width: 94,
                                      height: 34,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: const Color(0xff9A77CF),
                                      ),
                                      child: const Text(
                                        'Spin & Win',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                            'assets/svgs/akar_icon_coin.svg'),
                                        const Text(
                                          ' 50',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFFFE7A01),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Image.asset('assets/svgs/roll_dice.png'),
                              const SizedBox(
                                height: 12,
                              ),
                              CustomButton(
                                height: 48.0,
                                onPressed: () {},
                                buttonText: 'Play Now',
                                buttonColor: const Color(0xFFFE7A01),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 24,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xff262254),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      width: 94,
                                      height: 34,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: const Color(0xff9A77CF),
                                      ),
                                      child: const Text(
                                        'Spin & Win',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                            'assets/svgs/akar_icon_coin.svg'),
                                        const Text(
                                          ' 50',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFFFE7A01),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Image.asset('assets/svgs/roll_dice.png'),
                              const SizedBox(
                                height: 12,
                              ),
                              CustomButton(
                                height: 48.0,
                                onPressed: () {},
                                buttonText: 'Play Now',
                                buttonColor: const Color(0xFFFE7A01),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
