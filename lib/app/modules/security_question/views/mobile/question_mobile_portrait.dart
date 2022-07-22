import 'package:bot_toast/bot_toast.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jekawin_mobile_flutter/app/modules/referral/controllers/referral_controller.dart';
import 'package:jekawin_mobile_flutter/app/modules/referral/models/ReferralResponse.dart';
import 'package:jekawin_mobile_flutter/app/modules/security_question/controller/questions_controller.dart';
import 'package:jekawin_mobile_flutter/app/utils/helpers/text_helper.dart';
import 'package:share_plus/share_plus.dart';
import '../../../../config/themes/app_theme_constants.dart';
import '../../../../widgets/custom_large_button.dart';
import '../../../../widgets/custom_medium_button.dart';
import '../../../../widgets/custom_text_field.dart';
import '../../../../widgets/slide_in_animation.dart';
import '../../../fund_wallet/views/mobile/fund_wallet_mobile_portrait.dart';

class QuestionsMobilePortrait extends GetView<QuestionsController> {
  @override
  QuestionsMobilePortrait({Key? key, this.themeData, this.customAppTheme})
      : super(key: key);
  final ThemeData? themeData;
  final CustomAppTheme? customAppTheme;
  @override
  final QuestionsController controller = Get.put(QuestionsController());

  @override
  Widget build(BuildContext context) {
    List<String> questions = [ "Select question","Your mother’s maiden name","Your favourite meal","Your best color","Name of your first pet"];
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
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.only(
                  left: 24.0,
                  right: 24.0,
                  top: 12.0,
                ),
                child: Column(children: [
                  const Text(
                    'Set Security Question',
                    style: TextStyle(
                      fontSize: 24,
                      color: Color(0xff414249),
                    ),
                  ),

                  const Gap(18),
                  Text(
                    'Make Sure you choose a question you can remember',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.mulish(
                        fontWeight: FontWeight.normal, // light
                        fontStyle: FontStyle.normal,
                        color: Colors.black,
                        fontSize: 16 // italic
                    ),
                  ),
                  const Gap(10),

                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child:
                  DropdownButtonHideUnderline(
                    child: DropdownButtonFormField<String>(
                        value:  "Select question",
                        hint: const Text("Select question"),
                        icon: const Icon(Icons.keyboard_arrow_down),
                        // Array list of items
                        items: questions
                            .map((question) => DropdownMenuItem<String>(
                          child: Text(question),
                          value: question,
                        ))
                            .toList(),
                        onChanged: (selectedValue) {
                          controller.answerTextFieldController.text = "";
                          controller.selectedQuestion.value = selectedValue.toString();
                        }),
                  ),
                ),
                  const Gap(20),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: SlideInAnimation(
                      duration: const Duration(milliseconds: 650),
                      child: CustomTextField(
                        hintText: "Answer to secret question",
                        keyboardType: TextInputType.number,
                        textController: controller.answerTextFieldController,
                        onChanged: (v) {},
                      ),
                    ),
                  ),
                  const Gap(7),
                  Obx(
                        () => Text(
                      controller.errorQuestionMessage.value,
                      style: errorTextStyle,
                    ),
                  ),
                  const Gap(20),

                  CustomButton(
                      buttonText: "Save",
                      onPressed: () {
                        if(controller.selectedQuestion.value=="Select question" ){
                          BotToast.showText(text: "Choose a question");
                        }
                        controller.questionFormValidator();
                      }),
                ]))));
  }
}
