import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/modules/jackpot_games/controllers/jackpot_games_controller.dart';
import '../../../../widgets/custom_large_button.dart';
import 'jackpot_games_details_mobile_portrait.dart';

class JackpotGamesMobilePortrait extends StatelessWidget {
  final String gameID;
  final gameData;
  final int gameIndex;

  JackpotGamesMobilePortrait({
    Key? key,
    required this.gameID,
    required this.gameIndex,
    this.gameData,
  }) : super(key: key);

  final JackpotGamesController controller = Get.put(JackpotGamesController());
  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
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
                Future.delayed(const Duration(microseconds: 2), () {
                  controller.pin1.clear();
                  controller.pin2.clear();
                  controller.pin3.clear();
                  controller.pin4.clear();
                  controller.pin5.clear();
                });
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
                      SizedBox(
                        width: Get.width * .7,
                        child: Text(
                          'Select 5 numbers from a range of 0 - 99 or auto generate the numbers',
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
                          // Text('Multi Ticket'.toUpperCase()),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(children: [
                          Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Cost : ₦${gameData["gameID"]["price"]}',
                                        style: const TextStyle(
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
                                        onPressed: () {
                                          controller.pin1.text =
                                              (random.nextInt(99)).toString();
                                          controller.pin2.text =
                                              (random.nextInt(99)).toString();
                                          controller.pin3.text =
                                              (random.nextInt(99)).toString();
                                          controller.pin4.text =
                                              (random.nextInt(99)).toString();
                                          controller.pin5.text =
                                              (random.nextInt(99)).toString();
                                          FocusScope.of(context).unfocus();

                                          if (controller.pin1.text.length == 1) {
                                            controller.pin1.text =
                                                "0" + controller.pin1.text;
                                          }
                                          if (controller.pin2.text.length == 1) {
                                            controller.pin2.text =
                                                "0" + controller.pin2.text;
                                          }
                                          if (controller.pin3.text.length == 1) {
                                            controller.pin3.text =
                                                "0" + controller.pin3.text;
                                          }
                                          if (controller.pin4.text.length == 1) {
                                            controller.pin4.text =
                                                "0" + controller.pin4.text;
                                          }
                                          if (controller.pin5.text.length == 1) {
                                            controller.pin5.text =
                                                "0" + controller.pin5.text;
                                          }
                                        },
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
                                  Form(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          height: 54,
                                          width: 54,
                                          // margin: EdgeInsets.all(24),
                                          child: TextFormField(
                                            autofocus: true,
                                            controller: controller.pin1,
                                            onChanged: (value) {
                                              if (value.length == 2) {
                                                FocusScope.of(context)
                                                    .nextFocus();
                                              }
                                            },
                                            onSaved: (pin1) {},
                                            style: const TextStyle(
                                              color: Colors.black87,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w900,
                                            ),
                                            keyboardType: TextInputType.number,
                                            textAlign: TextAlign.center,
                                            // cursorHeight: 12,
                                            cursorColor: Colors.black87,
                                            decoration: InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                borderSide: const BorderSide(
                                                  color: Colors.black12,
                                                  width: 3,
                                                ),
                                              ),
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 40.0),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                borderSide: const BorderSide(
                                                  color: Color(0XFFFE7A01),
                                                  width: 3,
                                                ),
                                              ),
                                            ),
                                            inputFormatters: [
                                              LengthLimitingTextInputFormatter(2),
                                              FilteringTextInputFormatter
                                                  .digitsOnly,
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 54,
                                          width: 54,
                                          child: TextFormField(
                                            controller: controller.pin2,
                                            onChanged: (value) {
                                              if (value.length == 2) {
                                                FocusScope.of(context)
                                                    .nextFocus();
                                              } else if (value.length == 1) {
                                              } else {
                                                FocusScope.of(context)
                                                    .previousFocus();
                                              }
                                            },
                                            onSaved: (pin2) {},
                                            style: const TextStyle(
                                                color: Colors.black87,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w900),
                                            keyboardType: TextInputType.number,
                                            textAlign: TextAlign.center,
                                            // cursorHeight: 12,
                                            cursorColor: Colors.black87,
                                            decoration: InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                borderSide: const BorderSide(
                                                  color: Colors.black12,
                                                  width: 3,
                                                ),
                                              ),
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 40.0),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                borderSide: const BorderSide(
                                                  color: Color(0XFFFE7A01),
                                                  width: 3,
                                                ),
                                              ),
                                            ),
                                            inputFormatters: [
                                              LengthLimitingTextInputFormatter(2),
                                              FilteringTextInputFormatter
                                                  .digitsOnly,
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 54,
                                          width: 54,
                                          child: TextFormField(
                                            controller: controller.pin3,
                                            onChanged: (value) {
                                              if (value.length == 2) {
                                                FocusScope.of(context)
                                                    .nextFocus();
                                              } else if (value.length == 1) {
                                              } else {
                                                FocusScope.of(context)
                                                    .previousFocus();
                                              }
                                            },
                                            onSaved: (pin3) {},
                                            style: const TextStyle(
                                              color: Colors.black87,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w900,
                                            ),
                                            keyboardType: TextInputType.number,
                                            textAlign: TextAlign.center,
                                            // cursorHeight: 12,
                                            cursorColor: Colors.black87,
                                            decoration: InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                borderSide: const BorderSide(
                                                  color: Colors.black12,
                                                  width: 3,
                                                ),
                                              ),
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 40.0),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                borderSide: const BorderSide(
                                                  color: Color(0XFFFE7A01),
                                                  width: 3,
                                                ),
                                              ),
                                            ),
                                            inputFormatters: [
                                              LengthLimitingTextInputFormatter(2),
                                              FilteringTextInputFormatter
                                                  .digitsOnly,
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 54,
                                          width: 54,
                                          child: TextFormField(
                                            controller: controller.pin4,
                                            onChanged: (value) {
                                              if (value.length == 2) {
                                                FocusScope.of(context)
                                                    .nextFocus();
                                              } else if (value.length == 1) {
                                              } else {
                                                FocusScope.of(context)
                                                    .previousFocus();
                                              }
                                            },
                                            onSaved: (pin4) {},
                                            style: const TextStyle(
                                              color: Colors.black87,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w900,
                                            ),
                                            keyboardType: TextInputType.number,
                                            textAlign: TextAlign.center,
                                            // cursorHeight: 12,
                                            cursorColor: Colors.black87,
                                            decoration: InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                borderSide: const BorderSide(
                                                  color: Colors.black12,
                                                  width: 3,
                                                ),
                                              ),
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 40.0),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                borderSide: const BorderSide(
                                                  color: Color(0XFFFE7A01),
                                                  width: 3,
                                                ),
                                              ),
                                            ),
                                            inputFormatters: [
                                              LengthLimitingTextInputFormatter(2),
                                              FilteringTextInputFormatter
                                                  .digitsOnly,
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 54,
                                          width: 54,
                                          child: TextFormField(
                                            controller: controller.pin5,
                                            onChanged: (value) {
                                              if (value.length == 2) {
                                                FocusScope.of(context).unfocus();
                                              } else if (value.length == 1) {
                                              } else {
                                                FocusScope.of(context)
                                                    .previousFocus();
                                              }
                                            },
                                            onSaved: (pin6) {},
                                            style: const TextStyle(
                                              color: Colors.black87,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w900,
                                            ),
                                            keyboardType: TextInputType.number,
                                            textAlign: TextAlign.center,
                                            // cursorHeight: 12,
                                            cursorColor: Colors.black87,
                                            decoration: InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                borderSide: const BorderSide(
                                                  color: Colors.black12,
                                                  width: 3,
                                                ),
                                              ),
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 40.0),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                borderSide: const BorderSide(
                                                  color: Color(0XFFFE7A01),
                                                  width: 3,
                                                ),
                                              ),
                                            ),
                                            inputFormatters: [
                                              LengthLimitingTextInputFormatter(2),
                                              FilteringTextInputFormatter
                                                  .digitsOnly,
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 32,
                                  ),
                                  CustomButton(
                                    buttonText: "Confirm",
                                    onPressed: () =>
                                        controller.pin1.text.trim().length +
                                                    controller.pin2.text
                                                        .trim()
                                                        .length +
                                                    controller.pin3.text
                                                        .trim()
                                                        .length +
                                                    controller.pin4.text
                                                        .trim()
                                                        .length +
                                                    controller.pin5.text
                                                        .trim()
                                                        .length <
                                                10
                                            ? {}
                                            : Get.to(
                                                () =>
                                                    JackpotGamesDetailsMobilePortrait(
                                                  gameIndex: gameIndex,
                                                  gameId: gameID,
                                                  gameCost: gameData["gameID"]
                                                          ["price"]
                                                      .toString(),
                                                  numberOfGames: "1",
                                                  ticketNumber:
                                                      "${controller.pin1.text} ${controller.pin2.text} ${controller.pin3.text} ${controller.pin4.text} ${controller.pin5.text}",
                                                ),
                                                transition: Transition.cupertino,
                                              ),
                                  ),
                                ],
                              ),
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
