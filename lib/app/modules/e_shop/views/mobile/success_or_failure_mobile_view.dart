import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/modules/jekawin_bottom_tabs/views/jakawin_bottom_tabs.dart';
import 'package:jekawin_mobile_flutter/app/widgets/custom_large_button.dart';

class SuccessOrFailureMobileView extends StatelessWidget {
  final String msg;
   bool success=true;
  final Widget className;
  SuccessOrFailureMobileView({
    Key? key,
    this.msg = 'Success',
    this.success=true,
    required this.className,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           success? SvgPicture.asset('assets/svgs/success_check.svg'):SvgPicture.asset('assets/svgs/fail.svg'),
            const SizedBox(
              height: 24,
            ),
            Text(
              msg,
              style: const TextStyle(
                fontSize: 18,
                color: Color(0xFF4E4B66),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 32.0,
              ),
              child: CustomButton(
                onPressed: () => Get.offAll(
                  () => className,
                  transition: Transition.cupertino,
                ),
                buttonText: 'Done',
              ),
            )
          ],
        ),
      ),
    );
  }
}
