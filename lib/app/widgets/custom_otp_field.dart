import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomOtpField extends StatefulWidget {
  final onComplete;
  const CustomOtpField({Key? key, this.onComplete}) : super(key: key);

  @override
  _CustomOtpFieldState createState() => _CustomOtpFieldState();

  @override
  String toStringShort() => 'Rounded With Cursor';
}

class _CustomOtpFieldState extends State<CustomOtpField> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color(0xff414249);
    var fillColor = Colors.grey.shade200;
    var borderColor = Colors.grey.withOpacity(.5);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: GoogleFonts.poppins(
        fontSize: 22,
        color: Colors.purple.shade900,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: borderColor),
      ),
    );

    return Pinput(
      showCursor: false,
      controller: pinController,
      focusNode: focusNode,
      androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsRetrieverApi,
      defaultPinTheme: defaultPinTheme,
      // inputFormatters: [
      // FilteringTextInputFormatter.digitsOnly
      // ], // Only numbers can be entered,
      validator: (value) {
        //Todo @felix implement validation if necessary
        // return null;
        return value == '1234' ? null : 'Pin is incorrect';
      },
      // onClipboardFound: (value) {
      //   debugPrint('onClipboardFound: $value');
      //   pinController.setText(value);
      // },
      hapticFeedbackType: HapticFeedbackType.lightImpact,
      onCompleted: debugPrint,
      cursor: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 9),
            width: 22,
            height: 1,
            color: focusedBorderColor,
          ),
        ],
      ),
      focusedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: focusedBorderColor),
        ),
      ),
      submittedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          color: fillColor,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: focusedBorderColor),
        ),
      ),
      errorPinTheme: defaultPinTheme.copyBorderWith(
        border: Border.all(color: Colors.redAccent),
      ),
    );
  }
}
