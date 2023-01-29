import 'dart:ffi';

import 'package:intl/intl.dart';

class TextUtils {
  TextUtils();

  String stripFirstZeroAddCountryCode(
      {required String number, String? code = '+234'}) {
    /// this function could me made to do a lot of things
    ///  Like check various user entries but that can be done on th ui
    ///  this will only take a number that start with zero and replace
    ///  with the country code.
    ///  Be sure to check it start with zero and its length is eleven digits
    ///  before using this function

    String newNumber = '';
    if (number.startsWith("0")) {
      newNumber = number.replaceRange(0, 1, code!);
    }
    return newNumber;
  }

  String hideNumberPart(String number) {
    String marsk = "****";
    String newNumber = '';
    if (number.length == 13) {
      newNumber = number.replaceRange(9, 13, marsk);
    } else if(number.length>13){
      newNumber = number.replaceRange(9, 13, marsk);
    }
    else {
      newNumber = number;
    }
    return newNumber;
  }

  String shortDate(DateTime date) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(date);
    return formatted; // something like 2013-04-20
  }

  //Safe returned types
  String? safeString(String? text) {
    return (text != null) ? text : "N/A";
  }

  int? safeInt(int? text) {
    return (text != null) ? text : 0;
  }

  Object safeDouble(Double? text) {
    return (text != null) ? text : 0.00;
  }

  Object safeFloat(Float? text) {
    return (text != null) ? text : 0.00;
  }

  Object safeBool(Bool? text) {
    return (text != null) ? text : false;
  }
}
