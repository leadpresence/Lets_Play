import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../config/services/auth_service.dart';
import '../../e_shop/views/mobile/success_or_failure_mobile_view.dart';
import '../../user_profile/views/user_profile_view.dart';

class QuestionsController extends GetxController{
  final AuthServiceImpl authService = Get.find<AuthServiceImpl>();
  var isLoading = false.obs;
  var selectedQuestion = "Select question".obs;

  final answerTextFieldController = TextEditingController();
  RxString errorQuestionMessage = "".obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void dispose() {

  }

  @override
  void onClose() {}

  questionFormValidator() {
    if ((GetUtils.isBlank(answerTextFieldController.text)) == true) {
      return errorQuestionMessage.value = 'Add a valid answer ';
    } else if (answerTextFieldController.text.length<3) {
      return errorQuestionMessage.value = 'Answer is too short ';
    } else {
      submitSecurityQuestion();
    }
  }

  Future<void> submitSecurityQuestion() async {
    isLoading.value = true;
    String question = selectedQuestion.value.toString();
    String answer = answerTextFieldController.text.toString();
    var questionData = await authService.setSecurityQuestion(question, answer);

    questionData.fold((l) {
      isLoading.value = false;
      BotToast.showText(text: l.message);
    }, (r) {
      isLoading.value = false;

      Get.to(() => SuccessOrFailureMobileView(
        msg: "Security question set successful",
        className: UserProfileView(),
      ));
      transition:
      Transition.cupertino;
    });
  }

}