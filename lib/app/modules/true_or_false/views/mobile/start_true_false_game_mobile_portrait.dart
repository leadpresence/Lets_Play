import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/modules/true_or_false/views/mobile/congratulations_view.dart';
import 'package:jekawin_mobile_flutter/app/widgets/custom_large_button.dart';

import '../../controllers/true_or_false_controller.dart';
import '../../models/true_or_false_game_response_model.dart';

class StartTrueFalseGameMobilePortrait extends StatelessWidget {
  StartTrueFalseGameMobilePortrait({Key? key}) : super(key: key);

  final TrueOrFalseController controller = Get.put(TrueOrFalseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: .2,
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
      body: FutureBuilder<dynamic>(
        future: controller.getTrueOrFalseGames(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            Scaffold(
              body: Text("Snapshot has error: ${snapshot.hasError.toString()}"),
            );
          } else if (snapshot.hasData) {
            var body = snapshot.data!.body.items;
            if (body.length == 0) {
              return const Center(
                child: Text(
                  "No True or False Games Available\nright now",
                  textAlign: TextAlign.center,
                ),
              );
            } else if (body.length > 0) {
              return Obx(
                () => Scaffold(
                  backgroundColor: Colors.white,
                  bottomNavigationBar: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                    ),
                    decoration: const BoxDecoration(
                        border: Border(top: BorderSide(color: Colors.black12))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                              buttonColor: const Color(0XFF10B447),
                              buttonText: 'True',
                              onPressed: () {
                                controller.playTrueOrFalseGames(
                                    gameId: body[controller.itemIndex.value].id,
                                    userGuess: true);

                                body[controller.itemIndex.value]
                                            .correctOption ==
                                        true
                                    ? controller.totalRewardPoints.value += 10
                                    : controller.totalRewardPoints.value;
                                showSuccessOrFailureDialog(
                                  context,
                                  isCorrect: body[controller.itemIndex.value]
                                              .correctOption ==
                                          true
                                      ? true
                                      : false,
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Expanded(
                            child: CustomButton(
                              buttonColor: const Color(0XFFDC1D10),
                              buttonText: 'False',
                              onPressed: () {
                                controller.playTrueOrFalseGames(
                                    gameId: body[controller.itemIndex.value].id,
                                    userGuess: false);
                                body[controller.itemIndex.value]
                                            .correctOption ==
                                        false
                                    ? controller.totalRewardPoints.value += 10
                                    : controller.totalRewardPoints.value;
                                showSuccessOrFailureDialog(
                                  context,
                                  isCorrect: body[controller.itemIndex.value]
                                              .correctOption ==
                                          false
                                      ? true
                                      : false,
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  body: SizedBox(
                    width: Get.width,
                    child: SingleChildScrollView(
                      physics: const ClampingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/svgs/t_f_mini_bg.png',
                            width: Get.width,
                            height: Get.height * .2,
                          ),
                          Container(
                            padding: const EdgeInsets.all(3),
                            margin:
                                const EdgeInsets.symmetric(horizontal: 24.0),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color(0xffFE7A01),
                                  Color(0xff915DC0),
                                  Color(0xffFE7A01),
                                  Color(0xffAD0C5A),
                                  Color(0xff720BA3),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(17),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    'assets/svgs/note_that.svg',
                                    color: const Color(0xffFE7A01),
                                    height: 16,
                                  ),
                                  const Expanded(
                                    child: Text(
                                      'Select “TRUE” or “FALSE” to indicate if the displayed price  is the right or wrong retail price for the item.',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xffFE7A01),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            '${controller.currentPage.value + 1}/${controller.body!.body.items.length}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0XFF414249),
                            ),
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                            height: Get.height * .5,
                            child: Flex(
                              direction: Axis.vertical,
                              children: [
                                Expanded(
                                  child: PageView.builder(
                                    controller: controller.bgPageController,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: body.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      controller.itemIndex.value = index;
                                      return Column(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(12),
                                            margin: const EdgeInsets.symmetric(
                                              horizontal: 24.0,
                                            ),
                                            decoration: BoxDecoration(
                                              gradient: const LinearGradient(
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                                colors: [
                                                  Color(0xffFE7A01),
                                                  Color(0xff915DC0),
                                                  Color(0xffFE7A01),
                                                  Color(0xffAD0C5A),
                                                  Color(0xff720BA3),
                                                ],
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: Container(
                                              height: Get.height * .3,
                                              width: Get.height * .3,
                                              padding: const EdgeInsets.all(16),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                              ),
                                              child: Image.network(
                                                body[index].imageUrl,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 12),
                                          Container(
                                            padding: const EdgeInsets.all(1),
                                            decoration: BoxDecoration(
                                              gradient: const LinearGradient(
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                                colors: [
                                                  Color(0xffFE7A01),
                                                  Color(0xff915DC0),
                                                  Color(0xffFE7A01),
                                                  Color(0xffAD0C5A),
                                                  Color(0xff720BA3),
                                                ],
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 14.0,
                                                vertical: 10.0,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(9),
                                              ),
                                              child: Text(
                                                '₦ ${body[index].suggestedPrice}',
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0XFF414249),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 18),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
          }
          return const Center(
            child:
                // Text(
                //   "No True or False Games Available\nright now",
                //   textAlign: TextAlign.center,
                // ),
                CircularProgressIndicator(
              color: Color(0xffFE7A01),
              strokeWidth: 3,
            ),
          );
        },
      ),
    );
  }

  void showSuccessOrFailureDialog(BuildContext context, {isCorrect = false}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          content: Container(
            height: Get.height * .4,
            width: Get.width * .9,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    isCorrect == true
                        ? Image.asset(
                            'assets/svgs/success_pop.png',
                            height: Get.width * .3,
                            width: Get.width * .3,
                          )
                        : SvgPicture.asset('assets/svgs/t_f_fail.svg'),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: isCorrect == true
                          ? const Text(
                              'YAY! You have just earned 10 reward points',
                              textAlign: TextAlign.center,
                            )
                          : const Text('Wrong Selection'),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 32.0),
                  child: SizedBox(
                    width: Get.width * .4,
                    height: 52,
                    child: CustomButton(
                      onPressed: () {
                        controller.currentPage.value == 4
                            ? Get.offAll(
                                () => CongratulationsView(
                                  totalPoints:
                                      controller.totalRewardPoints.value,
                                ),
                                transition: Transition.cupertino,
                              )
                            : {
                                controller.nextPage(),
                                Get.back(),
                              };
                      },
                      buttonText: 'Continue',
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
