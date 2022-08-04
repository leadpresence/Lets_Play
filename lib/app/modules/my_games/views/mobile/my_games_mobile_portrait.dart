import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../widgets/custom_text_field.dart';
import '../../../../widgets/fade_in_animations.dart';
import '../../controller/my_games_controller.dart';
import 'game_details.dart';

class MyGamesMobilePortrait extends StatelessWidget {
  MyGamesMobilePortrait({Key? key}) : super(key: key);
  final MyGamesController controller = Get.put(MyGamesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            elevation: .4,
            backgroundColor: Colors.white,
            expandedHeight: 104.0,
            leading: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: IconButton(
                splashRadius: 24,
                icon: SvgPicture.asset(
                  'assets/svgs/chevronLeft.svg',
                  color: const Color(0xff12121D),
                ),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
            stretch: true,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              titlePadding: const EdgeInsets.all(0),
              collapseMode: CollapseMode.pin,
              expandedTitleScale: 1,
              title: Container(
                padding: const EdgeInsets.only(
                  bottom: 12,
                ),
                child: Text(
                  "My Games",
                  style: GoogleFonts.mulish(
                    fontWeight: FontWeight.normal, // light
                    fontStyle: FontStyle.normal,
                    color: Colors.black,
                    fontSize: 24, // italic
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, int index) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 24.0,
                      right: 24.0,
                      top: 12,
                      bottom: 12,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 24,
                        ),
                        SizedBox(
                          height: 40,
                          child: CustomTextField(
                            hintText: "Search games",
                            textCapitalization: TextCapitalization.words,
                            textController: controller.searchController,
                            prefixIcon: 'assets/svgs/search.svg',
                            keyboardType: TextInputType.text,
                            onChanged: (v) {
                              if (v.isNotEmpty) {
                                controller.filterSearchResults(
                                    controller.searchController.text);
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        controller.searchedGamesData.isEmpty
                            ? FutureBuilder<dynamic>(
                                future: controller.getAllPlayedGamesFunc(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasError) {
                                    return Text(
                                        "Snapshot has error: ${snapshot.hasError.toString()}");
                                  } else if (snapshot.hasData) {
                                    var body = snapshot.data!;
                                    return body.body.games.length == 0
                                        ? const Text(
                                            "No Games History",
                                          )
                                        : ListView.builder(
                                            reverse: true,
                                            shrinkWrap: true,
                                            physics:
                                                const BouncingScrollPhysics(),
                                            scrollDirection: Axis.vertical,
                                            itemCount: body.body.games.length,
                                            padding: EdgeInsets.zero,
                                            itemBuilder: (BuildContext context,
                                                int position) {
                                              return body.body.games[position]
                                                          .amount ==
                                                      null
                                                  ? const SizedBox()
                                                  : FadeIn(
                                                      duration: const Duration(
                                                          milliseconds: 200),
                                                      delay: const Duration(
                                                          milliseconds: 200),
                                                      child: GestureDetector(
                                                        child: gameItem(
                                                          date: body
                                                              .body
                                                              .games[position]
                                                              .createdAt
                                                              .toString(),
                                                          title: body
                                                                      .body
                                                                      .games[
                                                                          position]
                                                                      .gameId !=
                                                                  null
                                                              ? body
                                                                  .body
                                                                  .games[
                                                                      position]
                                                                  .gameId["title"]
                                                              : "",
                                                          amount: body
                                                                      .body
                                                                      .games[
                                                                          position]
                                                                      .amount ==
                                                                  null
                                                              ? ""
                                                              : body
                                                                  .body
                                                                  .games[
                                                                      position]
                                                                  .amount
                                                                  .toString(),
                                                        ),
                                                        onTap: () {
                                                          Get.to(
                                                            () =>
                                                                GameDetailMobilePortrait(
                                                              date: body
                                                                  .body
                                                                  .games[
                                                                      position]
                                                                  .createdAt
                                                                  .toString(),
                                                              gameCost: body
                                                                          .body
                                                                          .games[
                                                                              position]
                                                                          .amount ==
                                                                      null
                                                                  ? ""
                                                                  : body
                                                                      .body
                                                                      .games[
                                                                          position]
                                                                      .amount
                                                                      .toString(),
                                                              numberOfGames: body
                                                                  .body
                                                                  .games[
                                                                      position]
                                                                  .duration
                                                                  .toString(),
                                                              ticketNumber: body
                                                                  .body
                                                                  .games[
                                                                      position]
                                                                  .tickets,
                                                              title: body
                                                                          .body
                                                                          .games[
                                                                              position]
                                                                          .gameId !=
                                                                      null
                                                                  ? body
                                                                      .body
                                                                      .games[
                                                                          position]
                                                                      .gameId["title"]
                                                                  : "",
                                                              status: body
                                                                  .body
                                                                  .games[
                                                                      position]
                                                                  .status,
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
                                      padding: EdgeInsets.only(top: 104.0),
                                      child: CupertinoActivityIndicator(
                                        color: Color(0xffFE7A01),
                                        // strokeWidth: 3,
                                      ),
                                    ),
                                  );
                                },
                              )
                            : ListView.builder(
                                reverse: true,
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemCount: controller.searchedGamesData.length,
                                padding: EdgeInsets.zero,
                                itemBuilder:
                                    (BuildContext context, int position) {
                                  return controller.searchedGamesData[position]
                                              .amount ==
                                          null
                                      ? const SizedBox()
                                      : FadeIn(
                                          duration:
                                              const Duration(milliseconds: 200),
                                          delay:
                                              const Duration(milliseconds: 200),
                                          child: GestureDetector(
                                            child: gameItem(
                                              date: controller
                                                  .searchedGamesData[position]
                                                  .createdAt
                                                  .toString(),
                                              title: controller
                                                          .searchedGamesData[
                                                              position]
                                                          .gameId !=
                                                      null
                                                  ? controller
                                                      .searchedGamesData[
                                                          position]
                                                      .gameId["title"]
                                                  : "",
                                              amount: controller
                                                          .searchedGamesData[
                                                              position]
                                                          .amount ==
                                                      null
                                                  ? ""
                                                  : controller
                                                      .searchedGamesData[
                                                          position]
                                                      .amount
                                                      .toString(),
                                            ),
                                            onTap: () {
                                              Get.to(
                                                () => GameDetailMobilePortrait(
                                                  date: controller
                                                      .searchedGamesData[
                                                          position]
                                                      .createdAt
                                                      .toString(),
                                                  gameCost: controller
                                                              .searchedGamesData[
                                                                  position]
                                                              .amount ==
                                                          null
                                                      ? ""
                                                      : controller
                                                          .searchedGamesData[
                                                              position]
                                                          .amount
                                                          .toString(),
                                                  numberOfGames: controller
                                                      .searchedGamesData[
                                                          position]
                                                      .duration
                                                      .toString(),
                                                  ticketNumber: controller
                                                      .searchedGamesData[
                                                          position]
                                                      .tickets,
                                                  title: controller
                                                              .searchedGamesData[
                                                                  position]
                                                              .gameId !=
                                                          null
                                                      ? controller
                                                          .searchedGamesData[
                                                              position]
                                                          .gameId["title"]
                                                      : "",
                                                  status: controller
                                                      .searchedGamesData[
                                                          position]
                                                      .status,
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                },
                              ),
                        const Gap(16),
                      ],
                    ),
                  ),
                );
              },
              childCount: 1,
            ),
          ),
        ],
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
