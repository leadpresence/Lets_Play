import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jekawin_mobile_flutter/app/modules/security_question/controller/questions_controller.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'mobile/question_mobile_portrait.dart';


class QuestionsView extends GetView<QuestionsController> {
  const QuestionsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (_) => OrientationLayoutBuilder(
        portrait: (_) => QuestionsMobilePortrait(),
        landscape: (_) => QuestionsMobilePortrait(),
      ),
      tablet: (_) => OrientationLayoutBuilder(
        portrait: (_) => QuestionsMobilePortrait(),
        landscape: (_) => QuestionsMobilePortrait(),
      ),
    );
  }
}
