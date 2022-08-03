import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/modules/add_bank_acccount/controllers/add_bank_controller.dart';
import '../../../../widgets/custom_large_button.dart';
import '../../../../widgets/custom_text_field.dart';
import '../../models/bank_response_model.dart';

class AddBankMobilePortrait extends GetView<AddBankController> {
  @override
  final AddBankController controller = Get.put(AddBankController());

  AddBankMobilePortrait({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const TextStyle errorTextStyle =
        TextStyle(fontSize: 8, color: Colors.deepOrange);

    // Initial Selected Value
    return Scaffold(
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
        FutureBuilder<List<Bank>>(
            future: controller.getBanks(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const
                DropdownButtonHideUnderline(
                    child:Center(
                      child: CupertinoActivityIndicator(
                        radius: 16.0,
                        color: Colors.white,
                      ),
                    ));
              } else if (snapshot.hasData) {
                List<Bank>? banks = snapshot.data;
                if (banks != null) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                    child:
                        Flex(
                          direction: Axis.horizontal,
                          children: [
                            Expanded(
                              child: DropdownButtonHideUnderline(
                                child: DropdownButtonFormField<String>(
                                    value: snapshot.data?.first.name,
                                    validator: (val) {
                                      return controller.validateBank(val.toString());
                                    },
                                    hint: const Text("Select Bank"),
                                    icon: const Icon(Icons.keyboard_arrow_down),
                                    // Array list of items
                                    items: snapshot.data
                                        ?.map((bank) => DropdownMenuItem<String>(
                                      child: Text(bank.name),
                                      value: bank.name,
                                    ))
                                        .toList(),
                                    onChanged: (selectedValue) {
                                      controller.bankNameController.text = "";
                                      controller.accountNumberController.text = "";
                                      controller.selectedBankName.value = selectedValue.toString();
                                      var item = controller.bList.value.toList()
                                          .firstWhere((bank) => bank.name == selectedValue.toString());
                                      controller.selectedBankCode.value = item.code.toString();
                                    }),
                              ),
                            ),
                          ],
                        )
                  );
                }
              }
              return const DropdownButtonHideUnderline(
              child:Center(
                child: CupertinoActivityIndicator(
                radius: 16.0,
                 color: Colors.orangeAccent,
                ),
              ));
            }),

        Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 10),
            child: CustomTextField(
              maxLength: 10,
                hintText: "Account Number",
                textController: controller.accountNumberController,
                onChanged: (v) {
                  if (v.isNotEmpty) {
                    if (v.length == 10) {
                      //enquire name
                      controller.getAccountName(v.toString(),
                          controller.selectedBankCode.value.toString());
                    }
                    controller.clearErrorAccountNumber();
                  }
                })),
        Padding(
            padding: const EdgeInsets.fromLTRB(24, 4, 24, 0),
            child: Obx(
              () => Text(
                controller.errorAccountNumberMessage.value,
                style: errorTextStyle,
              ),
            )),
        Padding(
            padding: const EdgeInsets.fromLTRB(24, 4, 24, 10),
            child: CustomTextField(
                readOnly: true,
                hintText: "Account name",
                textController: controller.bankNameController,
                onChanged: (v) {
                  if (v.isNotEmpty) {

                    // controller.clearErrorBankName();
                  }
                })),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 4, 24, 0),
          child: Obx(() => Text(
                controller.errorCardHolderNameMessage.value,
                style: errorTextStyle,
              )),
        ),
        const Gap(30),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 4, 24, 10),
          child: CustomButton(
              buttonText: "Save",
              onPressed: () {
                //validate form and submit
                controller.addBankFormValidator(key);
              }),
        ),
      ]),
    )));
  }
}
