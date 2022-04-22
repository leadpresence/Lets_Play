import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class InputTransactionPinController extends GetxController {
  final transactionPinController = TextEditingController();
  final transactionPinFocusNode = FocusNode();

  final Color focusedBorderColor = const Color(0xff414249),
      fillColor = Colors.grey.shade200,
      borderColor = Colors.grey.withOpacity(.5);

  final PinTheme defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: GoogleFonts.poppins(
      fontSize: 22,
      color: Colors.purple.shade900,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      border: Border.all(
        color: Colors.grey.withOpacity(.5),
      ),
    ),
  );

  @override
  void dispose() {
    transactionPinController.dispose();
    transactionPinFocusNode.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
