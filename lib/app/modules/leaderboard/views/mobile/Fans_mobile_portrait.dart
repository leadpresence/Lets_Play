// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:gap/gap.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:jekawin_mobile_flutter/app/modules/leaderboard/models/FansMdel.dart';
//
// import '../../../../config/themes/app_theme_constants.dart';
// import '../../../../utils/helpers/text_helper.dart';
// import '../../../../widgets/custom_large_button.dart';
// import '../../../../widgets/custom_text_field.dart';
// import '../../../../widgets/slide_in_animation.dart';
// import '../../../fund_wallet/views/mobile/fund_wallet_mobile_portrait.dart';
// import '../../controllers/leaderbooard_controller.dart';
//
// class FansMobilePortrait extends GetView<LeaderBoardController> {
//   FansMobilePortrait(this.themeData, this.customAppTheme, {Key? key})
//       : super(key: key);
//   final ThemeData? themeData;
//   final CustomAppTheme? customAppTheme;
//
//   @override
//   final LeaderBoardController controller =` Get.find();`
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           elevation: 0,
//           backgroundColor: Colors.white,
//           leading: Padding(
//             padding: const EdgeInsets.only(left: 16.0),
//             child: IconButton(
//               splashRadius: 24,
//               icon: SvgPicture.asset(
//                 'assets/svgs/chevronLeft.svg',
//                 color: const Color(0xff12121D),
//               ),
//               onPressed: () {
//                 Get.back();
//               },
//             ),
//           ),
//         ),
//         body: SafeArea(
//             child: SingleChildScrollView(
//                 child: Padding(
//                     padding: const EdgeInsets.only(
//                       left: 24.0,
//                       right: 24.0,
//                       top: 32.0,
//                     ),
//                     child: Column(children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(left: 16.0),
//                             child: IconButton(
//                               splashRadius: 24,
//                               icon: const Icon(Icons.add),
//                               onPressed: () {
//                                 //open Bottom sheet
//                                 showModalBottomSheet(
//                                     context: context,
//                                     isDismissible: true,
//                                     shape: const RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.vertical(
//                                             top: Radius.circular(25.0))),
//                                     isScrollControlled: true,
//                                     builder: _bottomSheetBuilder);
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                       const Text(
//                         'Fans Favorites',
//                         style: TextStyle(
//                           fontSize: 24,
//                           color: Color(0xff414249),
//                         ),
//                       ),
//                       const Gap(30),
//                       Obx(() => ListView.builder(
//                             shrinkWrap: true,
//                             physics: const BouncingScrollPhysics(),
//                             scrollDirection: Axis.vertical,
//                             itemCount: controller.fans.length,
//                             itemBuilder: (BuildContext context, int position) {
//                               return playerItem(
//                                   controller.fans[position], position);
//                             },
//                           )),
//                     ])))));
//   }
//
//   Widget playerItem(FanxtarsModel item, int position) {
//     return Container(
//         padding: const EdgeInsets.all(12),
//         margin: const EdgeInsets.fromLTRB(8, 9, 8, 8),
//         decoration: BoxDecoration(
//           color: const Color(0xFFFE7A01).withOpacity(.1),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             Row(
//                 mainAxisSize: MainAxisSize.max,
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Column(
//                     children: [
//                       Text(
//                         (position + 1).toString(),
//                         style: const TextStyle(
//                           fontSize: 13,
//                           color: Colors.black,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Column(
//                     children: [
//                       Container(
//                         height: 44,
//                         width: 44,
//                         decoration: const BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: Colors.white12,
//                           image: DecorationImage(
//                             image: NetworkImage(
//                                 "https://img.icons8.com/external-flat-icons-inmotus-design/344/external-Favorite-ui-flat-icons-inmotus-design.png"),
//                             fit: BoxFit.cover,
//                             alignment: Alignment.center,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Column(
//                     children: [
//                       Text(
//                         TextUtils().hideNumberPart(item.phone),
//                         maxLines: 1,
//                         style: const TextStyle(
//                           fontSize: 13,
//                           color: Colors.black,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Column(
//                     children: [
//                       Text(
//                         item.favorite,
//                         style: TextStyle(
//                           fontSize: 13,
//                           color: const Color(0xFFFE7A01).withOpacity(.7),
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ]),
//             const Gap(10),
//           ],
//         ));
//   }
//
//   Widget _bottomSheetBuilder(BuildContext context) {
//     return ListView(
//       children: [
//         Padding(
//           padding: MediaQuery.of(context).viewInsets,
//           child: Column(
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.only(left: 16.0),
//                 child: IconButton(
//                   splashRadius: 24,
//                   icon: SvgPicture.asset(
//                     'assets/svgs/chevronLeft.svg',
//                     color: const Color(0xff12121D),
//                   ),
//                   onPressed: () {
//                     Get.back();
//                   },
//                 ),
//               ),
//               Obx(() =>
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 40),
//                     child: Form(
//                       key: controller.favFormKey,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Gap(58),
//                           SlideInAnimation(
//                             duration: const Duration(milliseconds: 625),
//                             child: Align(
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "Tell us about 'U' and your best game ",
//                                 style: GoogleFonts.mulish(
//                                     fontWeight: FontWeight.normal, // light
//                                     fontStyle: FontStyle.normal,
//                                     color: Colors.black,
//                                     fontSize: 24 // italic
//                                     ),
//                               ),
//                             ),
//                           ),
//                           const Divider(
//                             height: 2.0,
//                           ),
//                           const Gap(20),
//                           Padding(
//                             padding: const EdgeInsets.fromLTRB(24, 40, 24, 4),
//                             child: SlideInAnimation(
//                               duration: const Duration(milliseconds: 650),
//                               child: CustomTextField(
//                                 hintText: "Name",
//                                 keyboardType: TextInputType.text,
//                                 textController: controller.fName,
//                                 onChanged: (v) {
//                                   if (v.isNotEmpty) controller.errorName();
//                                 },
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   controller.errorName.value,
//                                   style: errorTextStyle,
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.fromLTRB(24, 40, 24, 4),
//                             child: SlideInAnimation(
//                               duration: const Duration(milliseconds: 650),
//                               child: CustomTextField(
//                                 hintText: "Favorite game",
//                                 keyboardType: TextInputType.text,
//                                 textController: controller.fFavorite,
//                                 onChanged: (v) {
//                                   if (v.isNotEmpty) controller.errorFavorite();
//                                 },
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   controller.errorFavorite.value,
//                                   style: errorTextStyle,
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.fromLTRB(24, 8, 24, 4),
//                             child: SlideInAnimation(
//                               duration: const Duration(milliseconds: 675),
//                               child: CustomTextField(
//                                 hintText: "Age",
//                                 textController: controller.fAge,
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.fromLTRB(24, 10, 24, 0),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 Text(
//                                   controller.errorAge.value,
//                                   style: errorTextStyle,
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.fromLTRB(24, 8, 24, 4),
//                             child: SlideInAnimation(
//                               duration: const Duration(milliseconds: 675),
//                               child: CustomTextField(
//                                 hintText: "City",
//                                 textController: controller.fCity,
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.fromLTRB(24, 10, 24, 0),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 Text(
//                                   controller.errorCity.value,
//                                   style: errorTextStyle,
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.fromLTRB(24, 8, 24, 4),
//                             child: SlideInAnimation(
//                               duration: const Duration(milliseconds: 675),
//                               child: CustomTextField(
//                                 hintText: "Join- e.g July 2000",
//                                 textController: controller.fDateJoined,
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.fromLTRB(24, 10, 24, 0),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 Text(
//                                   controller.errorDateJoined.value,
//                                   style: errorTextStyle,
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.fromLTRB(24, 8, 24, 4),
//                             child: SlideInAnimation(
//                               duration: const Duration(milliseconds: 675),
//                               child: CustomTextField(
//                                 hintText: "Phone",
//                                 textController: controller.fPhone,
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.fromLTRB(24, 10, 24, 0),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 Text(
//                                   controller.errorPhone.value,
//                                   style: errorTextStyle,
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Obx(
//                             () => Padding(
//                               padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
//                               child: SlideInAnimation(
//                                 duration: const Duration(milliseconds: 725),
//                                 child: CustomButton(
//                                   isLoading: controller.isLoading.value,
//                                   buttonText: "Submit",
//                                   onPressed: () {
//                                     controller.favFormValidator(key);
//                                   },
//                                 ),
//                               ),
//                             ),
//                           ),
//                           const Gap(14),
//                         ],
//                       ),
//                     ),
//                   )),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
