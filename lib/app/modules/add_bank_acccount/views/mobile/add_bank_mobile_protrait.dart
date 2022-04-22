import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/modules/add_bank_acccount/controllers/add_bank_controller.dart';
import 'package:jekawin_mobile_flutter/app/modules/withdrawal_amount/views/withdrawal_amount_view.dart';

import '../../../../widgets/custom_large_button.dart';
import '../../../../widgets/custom_text_field.dart';

class AddBankMobilePortrait extends GetView<AddBankController> {
  @override
  final AddBankController controller = Get.put(AddBankController());

  AddBankMobilePortrait({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
    screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
    const TextStyle errorTextStyle =
        TextStyle(fontSize: 8, color: Colors.deepOrange);

    // List of items in our dropdown menu
    var items = [
      'GTB',
      'UBA-United Bank for Africa',
      'FBN - First Bank of Nigeria',
      'Polaris Bank',
      'Union Bank',
    ];
      // Initial Selected Value
        String dropdownvalue = items[0];
       return
        Obx(() =>
        Scaffold(
            body: SingleChildScrollView(
                child: Form(
      key: controller.addBankFormKey,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Gap(100),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Add bank details",
              style: TextStyle(
                  fontWeight: FontWeight.w200, // light
                  fontStyle: FontStyle.normal,
                  color: Colors.black,
                  fontSize: 24 // italic
                  ),
            )
          ],
        ),
        const Gap(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "A service charge of 1.4 % applies to card transactions.",
              style: TextStyle(
                  fontWeight: FontWeight.w300, // light
                  fontStyle: FontStyle.normal,
                  color: Colors.black,
                  fontSize: 11 // italic
                  ),
            )
          ],
        ),
        const Gap(10),
        Padding(
            padding: const EdgeInsets.fromLTRB(24, 40, 24, 10),
            child: CustomTextField(
                hintText: "Card holder’s name",
                textController: controller.cardHolderNameController,
                onChanged: (v) {
                  if (v.isNotEmpty) {
                    controller.clearErrorCardHolderName();
                  }
                })),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
          child: Text(
            controller.errorCardHolderNameMessage.value,
            style: errorTextStyle,
          ),
        ),
        Padding(
            padding: const EdgeInsets.fromLTRB(24, 12, 24, 10),
            child: CustomTextField(
                hintText: "Account Number",
                textController: controller.accountNumberController,
                onChanged: (v) {
                  if (v.isNotEmpty) {
                    controller.clearErrorAccountNumber();
                  }
                })),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
          child: Text(
            controller.errorAccountNumberMessage.value,
            style: errorTextStyle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
          child:
          InputDecorator(
            decoration:  const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(18))))    ,
              child: DropdownButtonHideUnderline(
                child: DropdownButtonFormField(
                    // decoration: const InputDecoration(
                    //   enabledBorder: UnderlineInputBorder(
                    //     borderSide: BorderSide(color: Colors.transparent),
                    //   ),
                    // ),
                    // Initial Value
                    value: dropdownvalue,
                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),
                    // Array list of items
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      // setState((){dropdownvalue = newValue!;}) ;
                    }),
              )),
        ),
        const Gap(30),

        Padding(
          padding: const EdgeInsets.fromLTRB(24, 4, 24, 10),
          child: CustomButton(
              buttonText: "Save",
              onPressed: () {
                //validate form and submit
                // controller.addBankFormValidator(key);
                Get.to(()=> const WithdrawalAmountView());
              }),
        ),
      ]),
    )))
    );
  }
}
