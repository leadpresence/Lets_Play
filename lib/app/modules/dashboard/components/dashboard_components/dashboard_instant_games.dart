import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../widgets/custom_large_button.dart';
import '../../../true_or_false/views/true_or_false_view.dart';

class DashboardInstantGames extends StatelessWidget {
  final trueFalseOnTap, doubleDoubleOnTap;
  const DashboardInstantGames(
      {Key? key, this.trueFalseOnTap, this.doubleDoubleOnTap})
      : super(key: key);

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
                SizedBox(height: 18),
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
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xff262254),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: const Color(0xff9A77CF),
                            ),
                            child: const Text(
                              'True or False',
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
                    Image.asset(
                      'assets/svgs/true_false.png',
                      height: 118,
                    ),
                    SizedBox(
                      width: Get.width * .36,
                      child: CustomButton(
                        height: 40.0,
                        onPressed: trueFalseOnTap,
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
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xff262254),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: const Color(0xff9A77CF),
                            ),
                            child: const Text(
                              'Double x2',
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
                    Image.asset(
                      'assets/svgs/double_double_mini.png',
                      height: 88,
                    ),
                    SizedBox(
                      width: Get.width * .36,
                      child: CustomButton(
                        height: 40.0,
                        onPressed: doubleDoubleOnTap,
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
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xff262254),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
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
                    Image.asset(
                      'assets/svgs/roll_dice.png',
                      height: 118,
                    ),
                    SizedBox(
                      width: Get.width * .36,
                      child: CustomButton(
                        height: 40.0,
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
