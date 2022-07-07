import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jekawin_mobile_flutter/app/widgets/fade_in_animations.dart';

import '../../../../widgets/custom_text_field.dart';
import '../../../../widgets/slide_in_animation.dart';
import '../../controller/my_games_controller.dart';
import 'game_details.dart';

class MyGamesMobilePortrait extends StatelessWidget {
  MyGamesMobilePortrait({Key? key}) : super(key: key);
  final MyGamesController controller = Get.put(MyGamesController());

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
            // vertical: 12.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FadeIn(
                duration: const Duration(milliseconds: 100),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
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
                height: 24,
              ),
              SizedBox(
                height: 40,
                child: CustomTextField(
                  hintText: "Search games",
                  textCapitalization: TextCapitalization.words,
                  // textController: ,
                  prefixIcon: 'assets/svgs/search.svg',
                  keyboardType: TextInputType.text,
                  onChanged: (v) {
                    if (v.isNotEmpty) {}
                  },
                ),
              ),
              const Gap(16),
              FutureBuilder<dynamic>(
                future: controller.getAllPlayedGamesFunc(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text(
                        "Snapshot has error: ${snapshot.hasError.toString()}");
                  } else if (snapshot.hasData) {
                    var body = snapshot.data!;
                    print("BOOOOOOOOOdy: \n $body");
                    return body.body.games.length < 1
                        ? const Text(
                            "No Games History",
                          )
                        : ListView.builder(
                            reverse: true,
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: body.body.games.length,
                            itemBuilder: (BuildContext context, int position) {
                              return FadeIn(
                                duration: const Duration(milliseconds: 200),
                                delay: const Duration(milliseconds: 200),
                                child: GestureDetector(
                                  child: gameItem(
                                    date: body.body.games[position].createdAt
                                        .toString(),
                                    title:
                                        body.body.games[position].gameId != null
                                            ? body.body.games[position]
                                                .gameId["title"]
                                            : "",

                                    // body.body.games[position]
                                    //     .gameId['title']
                                    //     .toString(),
                                    amount:
                                        body.body.games[position].amount == null
                                            ? ""
                                            : body.body.games[position].amount
                                                .toString(),
                                  ),
                                  onTap: () {
                                    Get.to(
                                      () => GameDetailMobilePortrait(
                                        date: body
                                            .body.games[position].createdAt
                                            .toString(),
                                        gameCost: body.body.games[position]
                                                    .amount ==
                                                null
                                            ? ""
                                            : body.body.games[position].amount
                                                .toString(),
                                        numberOfGames: body
                                            .body.games[position].duration
                                            .toString(),
                                        ticketNumber:
                                            body.body.games[position].tickets,
                                        title:
                                            body.body.games[position].gameId !=
                                                    null
                                                ? body.body.games[position]
                                                    .gameId["title"]
                                                : "",
                                        status:
                                            body.body.games[position].status,
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          );
                  }
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 24.0),
                      child: CircularProgressIndicator(
                        color: Color(0xffFE7A01),
                        strokeWidth: 3,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget gameItem({date, title, amount}) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                controller.f.format(DateTime.parse(date)),
                style: GoogleFonts.mulish(
                  fontSize: 12,
                  color: const Color(0xFF414249),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const Gap(16),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF414249),
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '₦$amount.00',
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF414249),
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
