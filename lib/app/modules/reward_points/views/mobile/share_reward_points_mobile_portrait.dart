import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../widgets/custom_large_button.dart';
import '../../../../widgets/custom_text_field.dart';
import '../../controllers/reward_points_controller.dart';

class ShareRewardPointsMobilePortrait extends StatelessWidget {
  ShareRewardPointsMobilePortrait({Key? key}) : super(key: key);

  final RewardPointsController controller = Get.put(RewardPointsController());

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
      body: Obx(
        () => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 12.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Share Reward Points',
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(0xff414249),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      hintText: "Amount of points",
                      textController: controller.amountOfPointsTextController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      onChanged: (val) {
                        controller.clearAmountOfPointsFieldError();
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.all(
                        controller.amountOfPointsFieldError.value == ''
                            ? 0
                            : 8.0,
                      ),
                      child: Text(
                        controller.amountOfPointsFieldError.value,
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.normal,
                          letterSpacing: .2,
                          height:
                              controller.amountOfPointsFieldError.value == ''
                                  ? 0
                                  : 1,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: controller.amountOfPointsFieldError.value == ''
                      ? 24.0
                      : 16.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      hintText: "Receiver's phone Number",
                      textController: controller.receiverPhoneTextController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      onChanged: (val) {
                        controller.clearReceiverPhoneFieldError();
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.all(
                        controller.receiverPhoneFieldError.value == ''
                            ? 0
                            : 8.0,
                      ),
                      child: Text(
                        controller.receiverPhoneFieldError.value,
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.normal,
                          letterSpacing: .2,
                          height: controller.receiverPhoneFieldError.value == ''
                              ? 0
                              : 1,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: controller.receiverPhoneFieldError.value == ''
                      ? 32.0
                      : 24.0,
                ),
                CustomButton(
                  isLoading: controller.isLoading.value,
                  buttonText: "Send",
                  onPressed: () => controller.shareRewardPointsValidation(key),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
