// This will contain functions like taking the first letter from a name, 
// splitting a path to get a specific value etc.
// I'm not sure of this helpers folder yet, we may delete it in favor of mixins

import 'package:intl/intl.dart';

class TextUtils{
  TextUtils();
  String stripFirstZeroAddCountryCode({required String number, String? code='+234'}){
    /// this function could me made to do a lot if things
    ///  Like check various user entries but that can be done on th ui
    ///  this will only take a number that start with zero and replace
    ///  with the country code.
    ///  Be sure to check it start with zero and its length is eleven digits
    ///  before using this function

    String newNumber='';
    if(number.startsWith("0")){
      newNumber   =  number.replaceRange(0,1,code!);
    }
    return newNumber;
  }

  String shortDate(DateTime date){
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(date);
    return formatted; // something like 2013-04-20
  }
}

