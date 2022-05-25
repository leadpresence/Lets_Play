import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../widgets/custom_text_field.dart';
import '../../../../widgets/slide_in_animation.dart';

class MyGamesMobilePortrait extends StatelessWidget {
  const MyGamesMobilePortrait({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: IconButton(
            splashRadius: 25,
            icon: SvgPicture.asset(
              'assets/svgs/chevronLeft.svg',
              color: const Color(0xff12121D),
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 12.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SlideInAnimation(
                  duration: const Duration(milliseconds: 625),
                  child: Align(
                    alignment: Alignment.center,
                    child:
                    Text(
                      "My Games",
                      style: GoogleFonts.mulish(
                          fontWeight: FontWeight.normal, // light
                          fontStyle: FontStyle.normal,
                          color: Colors.black,
                          fontSize: 24 // italic
                      ),
                    ),
                  ),
                ),
              const SizedBox(
                height: 16,
              ),
                CustomTextField(
                  hintText: "Search games",
                  textCapitalization: TextCapitalization.words,
                  // textController: ,
                  // prefixIcon: 'assets/svgs/search.svg',
                  keyboardType: TextInputType.text,
                  onChanged: (v) {
                    if (v.isNotEmpty) {
                    }
                  },
                ),

                const Gap(20),
                //
                //   controller.games.isEmpty?
                // SizedBox(
                // height: Get.height * .35,
                //   child: const Center(
                //     child: Text(
                //       'No Games yet,\n All games will show here.',
                //       style: TextStyle(
                //         fontSize: 18,
                //         color: Color(0xff414249),
                //       ),
                //       textAlign: TextAlign.center,
                //     ),
                //   ),
                // ):
                ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: 14,
                  itemBuilder: (BuildContext context, int position) {
                    return gameItem();
                  },
                ),
                // ),

              ],
            ),
          ),
        ),

    );
  }

  Widget gameItem() {
    return Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.fromLTRB(8, 9, 8, 8),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                     "01/04/22" ,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,

                      fontWeight: FontWeight.w600,
                    ),
                  ),

                ]),
            const Gap(10),
            Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Jackpot Maxi ", style: TextStyle(
                    fontSize: 13,
                    color: Colors.black45,
                    fontWeight: FontWeight.w700,
                  ),),
                  Text("₦200.00",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black45,
                      fontWeight: FontWeight.w700,

                    ),

                  )
                ]),
          ],
        ));
  }

}
