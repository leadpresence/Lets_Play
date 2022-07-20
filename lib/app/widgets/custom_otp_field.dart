import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomOtpField extends StatefulWidget {
  final onComplete;
  final length;
  final obscureText;
  final pinController;

  const CustomOtpField({
    Key? key,
    this.onComplete,
    this.obscureText,
    required this.pinController,
    this.length = 4,
  }) : super(key: key);

  @override
  _CustomOtpFieldState createState() => _CustomOtpFieldState();

  @override
  String toStringShort() => 'Rounded With Cursor';
}

class _CustomOtpFieldState extends State<CustomOtpField> {
  final focusNode = FocusNode();

  @override
  void dispose() {
    // widget.pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color.fromRGBO(33, 22, 52, 1);
    var fillColor = const Color(0XFF12121D).withOpacity(.1);
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
      length: widget.length,
      controller: widget.pinController,
      focusNode: focusNode,
      obscureText: widget.obscureText,
      showCursor: false,
      androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsRetrieverApi,
      defaultPinTheme: defaultPinTheme,
      validator: (value) {
        return null;
      },
      // onClipboardFound: (value) {
      //   debugPrint('onClipboardFound: $value');
      //   widget.pinController.setText(value);
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
