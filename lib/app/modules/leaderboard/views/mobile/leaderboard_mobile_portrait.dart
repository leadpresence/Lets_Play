import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jekawin_mobile_flutter/app/modules/leaderboard/controllers/leaderbooard_controller.dart';
import 'package:jekawin_mobile_flutter/app/utils/helpers/text_helper.dart';
import '../../../../config/themes/app_theme_constants.dart';
import '../../../../widgets/slide_in_animation.dart';
import '../../models/leader_board_response.dart';

class LeaderBoardMobilePortrait extends GetView<LeaderBoardController> {
  @override
  LeaderBoardMobilePortrait({Key? key, this.themeData, this.customAppTheme})
      : super(key: key);
  final ThemeData? themeData;
  final CustomAppTheme? customAppTheme;
  @override
  final LeaderBoardController controller = Get.put(LeaderBoardController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
              child: SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.only(
                        left: 24.0,
                        right: 24.0,
                        top: 2.0,
                      ),
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: IconButton(
                                splashRadius: 24,
                                icon: SvgPicture.asset(
                                  'assets/svgs/share.svg',
                                  color: const Color(0xff12121D),
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          'Leaderboard',
                          style: TextStyle(
                            fontSize: 24,
                            color: Color(0xff414249),
                          ),
                        ),
                        const Gap(24),
                        TabBar(
                            unselectedLabelColor: Colors.orangeAccent,
                            indicatorSize: TabBarIndicatorSize.label,
                            indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.orangeAccent.shade100),
                            tabs: [
                              Tab(
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          border: Border.all(
                                              color: Colors.orange.shade100,
                                              width: 1)),
                                      child: const Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Today',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ))),
                              Tab(
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          border: Border.all(
                                              color: Colors.orange.shade100,
                                              width: 1)),
                                      child: const Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Week',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ))),
                              Tab(
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          border: Border.all(
                                              color: Colors.orange.shade100,
                                              width: 1)),
                                      child: const Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Month',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ))),
                            ]),
                        SizedBox(
                          height: Get.height * 0.7,
                          child: TabBarView(children: [
                            todayHighPlayerList(),
                            weekHighPlayerList(),
                            monthHighPlayersList()
                          ]),
                        )
                      ]))
                  // ),
                  ))),
    );
  }

  Widget todayHighPlayerList() {
    return SlideInAnimation(
        duration: const Duration(milliseconds: 600),
        child: Column(
          children: [
            FutureBuilder<LeaderBoardResponse?>(
                future: controller.getLeaderBoard("week"),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: SizedBox(
                        width: Get.width,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 150.0,
                          ),
                          child: Text(
                            snapshot.error.toString(),
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 24,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    );
                  } else if (snapshot.hasData) {
                    List<ScoreItem>? players = snapshot.data?.data;
                    // snapshot.data?.data=controller.playerScoreItem.value;
                    if (players != null) {
                      if (players.length > 1) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  const Gap(80),
                                  winners(
                                      position: '2',
                                      userImage: players[1].imageUrl),
                                  const Gap(15),
                                  Text(TextUtils()
                                      .hideNumberPart(players[1].phone)),
                                  const Gap(4),
                                  Text(
                                    players[1].score.toString() + " Rpt",
                                    style:
                                        const TextStyle(color: Colors.orange),
                                  )
                                ]),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                firstWinners(
                                    position: '1',
                                    userImage: players[0].imageUrl),
                                const Gap(15),
                                Text(TextUtils()
                                    .hideNumberPart(players[0].phone)),
                                const Gap(4),
                                Text(
                                  players[0].score.toString() + " Rpt",
                                  style: const TextStyle(color: Colors.orange),
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Gap(80),
                                winners(
                                    position: '3',
                                    userImage: players[2].imageUrl),
                                const Gap(15),
                                Text(TextUtils()
                                    .hideNumberPart(players[2].phone)),
                                const Gap(4),
                                Text(
                                  players[2].score.toString() + " Rpt",
                                  style: const TextStyle(color: Colors.orange),
                                )
                              ],
                            )
                          ],
                        );
                      }
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        children: const [SizedBox()],
                      );
                    }
                  }
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 32.0),
                      child: CupertinoActivityIndicator(
                        color: Colors.grey,
                      ),
                    ),
                  );
                }),
            const Gap(20),
            FutureBuilder<LeaderBoardResponse?>(
                future: controller.getLeaderBoard("day"),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: SizedBox(
                        width: Get.width,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 150.0,
                          ),
                          child: Text(
                            snapshot.error.toString(),
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 24,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    );
                  } else if (snapshot.hasData) {
                    List<ScoreItem>? scores = snapshot.data?.data;
                    // snapshot.data?.data=controller.playerScoreItem.value;
                    debugPrint("SCORES ARE ${scores?.length.toString()}");
                    if (scores != null) {
                      if (scores.length > 1) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: scores.length,
                          itemBuilder: (BuildContext context, int position) {
                            return playerItem(scores[position], position);
                          },
                        );
                      }
                      return Center(
                        child: SizedBox(
                          width: Get.width,
                          child: const Padding(
                            padding: EdgeInsets.only(
                              top: 150.0,
                            ),
                            child: Text(
                              "No Games scores History for \nthis period",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 24,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      );
                    }
                  }
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 32.0),
                      child: CupertinoActivityIndicator(
                        color: Colors.grey,
                      ),
                    ),
                  );
                }),
          ],
        ));
  }

  Widget weekHighPlayerList() {
    return Column(
      children: [
        FutureBuilder<LeaderBoardResponse?>(
            future: controller.getLeaderBoard("week"),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: SizedBox(
                    width: Get.width,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 150.0,
                      ),
                      child: Text(
                        snapshot.error.toString(),
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 24,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                );
              } else if (snapshot.hasData) {
                List<ScoreItem>? players = snapshot.data?.data;
                // snapshot.data?.data=controller.playerScoreItem.value;
                if (players != null) {
                  if (players.length > 1) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              const Gap(80),
                              winners(
                                  position: '2',
                                  userImage: players[1].imageUrl),
                              const Gap(15),
                              Text(
                                  TextUtils().hideNumberPart(players[1].phone)),
                              const Gap(4),
                              Text(
                                players[1].score.toString() + " Rpt",
                                style: const TextStyle(color: Colors.orange),
                              )
                            ]),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            firstWinners(
                                position: '1', userImage: players[0].imageUrl),
                            const Gap(15),
                            Text(TextUtils().hideNumberPart(players[0].phone)),
                            const Gap(4),
                            Text(
                              players[0].score.toString() + " Rpt",
                              style: const TextStyle(color: Colors.orange),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Gap(80),
                            winners(
                                position: '3', userImage: players[2].imageUrl),
                            const Gap(15),
                            Text(TextUtils().hideNumberPart(players[2].phone)),
                            const Gap(4),
                            Text(
                              players[2].score.toString() + " Rpt",
                              style: const TextStyle(color: Colors.orange),
                            )
                          ],
                        )
                      ],
                    );
                  }
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: const [SizedBox()],
                  );
                }
              }
              return const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 32.0),
                  child: CupertinoActivityIndicator(
                    color: Colors.grey,
                  ),
                ),
              );
            }),
        const Gap(20),
        FutureBuilder<LeaderBoardResponse?>(
            future: controller.getLeaderBoard("week"),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: SizedBox(
                    width: Get.width,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 150.0,
                      ),
                      child: Text(
                        snapshot.error.toString(),
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 24,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                );
              } else if (snapshot.hasData) {
                List<ScoreItem>? scores = snapshot.data?.data;
                // snapshot.data?.data=controller.playerScoreItem.value;
                debugPrint("SCORES ARE ${scores?.length.toString()}");
                if (scores != null) {
                  if (scores.length > 1) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: scores.length,
                      itemBuilder: (BuildContext context, int position) {
                        return playerItem(scores[position], position);
                      },
                    );
                  }
                  return Center(
                    child: SizedBox(
                      width: Get.width,
                      child: const Padding(
                        padding: EdgeInsets.only(
                          top: 150.0,
                        ),
                        child: Text(
                          "No Games scores History for \nthis period",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 24,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  );
                }
              }
              return const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 32.0),
                  child: CupertinoActivityIndicator(
                    color: Colors.grey,
                  ),
                ),
              );
            }),
      ],
    );
  }

  Widget monthHighPlayersList() {
    return Column(
      children: [
        FutureBuilder<LeaderBoardResponse?>(
            future: controller.getLeaderBoard("month"),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: SizedBox(
                    width: Get.width,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 150.0,
                      ),
                      child: Text(
                        snapshot.error.toString(),
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 24,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                );
              } else if (snapshot.hasData) {
                List<ScoreItem>? players = snapshot.data?.data;
                if (players != null) {
                  if (players.length > 1) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              const Gap(80),
                              winners(
                                  position: '2',
                                  userImage: players[1].imageUrl),
                              const Gap(15),
                              Text(
                                  TextUtils().hideNumberPart(players[1].phone)),
                              const Gap(4),
                              Text(
                                players[1].score.toString() + " Rpt",
                                style: const TextStyle(color: Colors.orange),
                              )
                            ]),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            firstWinners(
                                position: '1', userImage: players[0].imageUrl),
                            const Gap(105),
                            Text(TextUtils().hideNumberPart(players[0].phone)),
                            const Gap(4),
                            Text(
                              players[0].score.toString() + " Rpt",
                              style: const TextStyle(color: Colors.orange),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Gap(80),
                            winners(
                                position: '3', userImage: players[2].imageUrl),
                            const Gap(15),
                            Text(TextUtils().hideNumberPart(players[2].phone)),
                            const Gap(4),
                            Text(
                              players[2].score.toString() + " Rpt",
                              style: const TextStyle(color: Colors.orange),
                            )
                          ],
                        )
                      ],
                    );
                  }
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: const [SizedBox()],
                  );
                }
              }
              return const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 32.0),
                  child: CupertinoActivityIndicator(
                    color: Colors.grey,
                  ),
                ),
              );
            }),
        const Gap(20),
        FutureBuilder<LeaderBoardResponse?>(
            future: controller.getLeaderBoard("month"),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: SizedBox(
                    width: Get.width,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 150.0,
                      ),
                      child: Text(
                        snapshot.error.toString(),
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 24,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                );
              } else if (snapshot.hasData) {
                List<ScoreItem>? scores = snapshot.data?.data;
                // snapshot.data?.data=controller.playerScoreItem.value;
                if (scores != null) {
                  if (scores.length > 1) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: scores.length,
                      itemBuilder: (BuildContext context, int position) {
                        return playerItem(scores[position], position);
                      },
                    );
                  }
                  return Center(
                    child: SizedBox(
                      width: Get.width,
                      child: const Padding(
                        padding: EdgeInsets.only(
                          top: 150.0,
                        ),
                        child: Text(
                          "No Games scores History for \nthis period",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 24,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  );
                }
              }
              return const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 32.0),
                  child: CupertinoActivityIndicator(
                    color: Colors.grey,
                  ),
                ),
              );
            }),
      ],
    );
  }

  Widget winners(
      {required String position,
      bool showCrown = false,
      required String userImage}) {
    return Stack(clipBehavior: Clip.none, children: [
      Positioned(
          child: Container(
        height: 64,
        width: 64,
        margin: const EdgeInsets.only(
          left: 12,
          right: 12,
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black, width: 5),
          color: Colors.white12,
        ),
        child: Center(
          child: Container(
            height: 64,
            width: 64,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white12,
              image: DecorationImage(
                image: NetworkImage(userImage),
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
          ),
        ),
      )),
      Positioned(
          top: 45,
          left: 30,
          child: Container(
            height: 34,
            width: 34,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black, width: 5),
              color: Colors.white,
            ),
            child: Center(
              child: Text(
                position,
                style: GoogleFonts.kumarOneOutline(
                    textStyle: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          )),
    ]);
  }

  Widget firstWinners({required String position, required String userImage}) {
    return Stack(clipBehavior: Clip.none, children: [
      Positioned(
          top: 55,
          left: -28,
          child: Container(
            height: 104,
            width: 104,
            margin: const EdgeInsets.only(
              left: 12,
              right: 12,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.yellow, width: 5),
              color: Colors.white12,
            ),
            child: Center(
              child: Container(
                height: 104,
                width: 104,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white12,
                  image: DecorationImage(
                    image: NetworkImage(userImage),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
            ),
          )),
      Positioned(
          top: 135,
          left: 23,
          child: Container(
            height: 34,
            width: 34,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black, width: 5),
              color: Colors.white,
            ),
            child: Center(
              child: Text(
                position,
                style: GoogleFonts.kumarOneOutline(
                    textStyle: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          )),
      //Crown
      Positioned(
          child: SvgPicture.asset(
        'assets/svgs/Crown.svg',
      ))
    ]);
  }

  Widget playerItem(ScoreItem item, int position) {
    return Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.fromLTRB(8, 9, 8, 8),
        decoration: BoxDecoration(
          color: const Color(0xFFFE7A01).withOpacity(.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        (position + 1).toString(),
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 44,
                        width: 44,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white12,
                          image: DecorationImage(
                            image: NetworkImage(item.imageUrl),
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        TextUtils().hideNumberPart(item.phone),
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        item.score.toString() + " Rpt",
                        style: TextStyle(
                          fontSize: 13,
                          color: const Color(0xFFFE7A01).withOpacity(.7),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ]),
            const Gap(10),
          ],
        ));
  }
}
