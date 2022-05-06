import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../widgets/custom_large_button.dart';

class DashboardInstantGames extends StatelessWidget {
  const DashboardInstantGames({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SizedBox(
            width: Get.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Instant Wins',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff414249),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 260,
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xff262254),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    SizedBox(
                      width: Get.width * .32,
                      child: CustomButton(
                        height: 44.0,
                        onPressed: () {},
                        buttonText: 'Play Now',
                        buttonColor: const Color(0xFFFE7A01),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xff262254),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    SizedBox(
                      width: Get.width * .32,
                      child: CustomButton(
                        height: 44.0,
                        onPressed: () {},
                        buttonText: 'Play Now',
                        buttonColor: const Color(0xFFFE7A01),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xff262254),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    SizedBox(
                      width: Get.width * .32,
                      child: CustomButton(
                        height: 44.0,
                        onPressed: () {},
                        buttonText: 'Play Now',
                        buttonColor: const Color(0xFFFE7A01),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xff262254),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    SizedBox(
                      width: Get.width * .32,
                      child: CustomButton(
                        height: 44.0,
                        onPressed: () {},
                        buttonText: 'Play Now',
                        buttonColor: const Color(0xFFFE7A01),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        SizedBox(
          height: 260,
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xff262254),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    SizedBox(
                      width: Get.width * .32,
                      child: CustomButton(
                        height: 44.0,
                        onPressed: () {},
                        buttonText: 'Play Now',
                        buttonColor: const Color(0xFFFE7A01),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xff262254),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    SizedBox(
                      width: Get.width * .32,
                      child: CustomButton(
                        height: 44.0,
                        onPressed: () {},
                        buttonText: 'Play Now',
                        buttonColor: const Color(0xFFFE7A01),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xff262254),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    SizedBox(
                      width: Get.width * .32,
                      child: CustomButton(
                        height: 44.0,
                        onPressed: () {},
                        buttonText: 'Play Now',
                        buttonColor: const Color(0xFFFE7A01),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xff262254),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    SizedBox(
                      width: Get.width * .32,
                      child: CustomButton(
                        height: 44.0,
                        onPressed: () {},
                        buttonText: 'Play Now',
                        buttonColor: const Color(0xFFFE7A01),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
