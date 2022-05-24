import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jekawin_mobile_flutter/app/modules/leaderboard/controllers/leaderbooard_controller.dart';
import '../../../../config/themes/app_theme_constants.dart';
import '../../../../widgets/slide_in_animation.dart';

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
    var showToday = controller.showDaily.value;
    var showWeekly = controller.showWeekly.value;
    var showMonthly = controller.showMonthly.value;
    return
        // Obx(() =>
        Scaffold(
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
                                padding: EdgeInsets.only(left: 16.0),
                                child: IconButton(
                                  splashRadius: 24,
                                  icon: SvgPicture.asset(
                                    'assets/svgs/share.svg',
                                    color: Color(0xff12121D),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // today chip
                              Obx(
                                () => GestureDetector(
                                  child: Chip(
                                    elevation: 0,
                                    padding: const EdgeInsets.all(8),
                                    backgroundColor: controller.showDaily.value
                                        ? Color(0xffFE7A01).withOpacity(.2)
                                        : Colors.white,
                                    shadowColor: Colors.white,
                                    //CircleAvatar
                                    label: const Text(
                                      'Today',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    //Text
                                  ),
                                  onTap: () {
                                    controller.toggleToday();
                                  },
                                ),
                              ),
                              // Week chip
                              Obx(
                                () => GestureDetector(
                                  child: Chip(
                                    elevation: 0,
                                    padding: const EdgeInsets.all(8),
                                    backgroundColor: controller.showWeekly.value
                                        ? Color(0xffFE7A01).withOpacity(.3)
                                        : Colors.white,
                                    //CircleAvatar
                                    label: const Text(
                                      'Week',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    //Text
                                  ),
                                  onTap: () {
                                    controller.toggleWeek();
                                  },
                                ),
                              ),
                              //Month chip
                              Obx(
                                () => GestureDetector(
                                  child: Chip(
                                    elevation: 0,
                                    padding: const EdgeInsets.all(8),
                                    backgroundColor:
                                        controller.showMonthly.value
                                            ? Color(0xffFE7A01).withOpacity(.3)
                                            : Colors.white,
                                    //CircleAvatar
                                    label: const Text(
                                      'Month',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    //Text
                                  ),
                                  onTap: () => controller.toggleMonthly(),
                                ),
                              ),
                            ],
                          ),
                          // SizedBox(
                          //   height: 50,
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Gap(80),
                                    winners(
                                      position: '2',
                                      userImage:
                                          "https://media.istockphoto.com/photos/smiling-black-guy-using-smartphone-wearing-african-tshirt-picture-id1256457468?s=612x612",
                                    ),
                                    Gap(15),
                                    Text("0903768****"),
                                    Gap(4),
                                    Text(
                                      "1200 Rpt",
                                      style: TextStyle(color: Colors.orange),
                                    )
                                  ]),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  firstWinners(
                                    position: '1',
                                    userImage:
                                        "https://media.istockphoto.com/photos/smiling-black-guy-using-smartphone-wearing-african-tshirt-picture-id1256457468?s=612x612",
                                  ),
                                  Gap(105),
                                  Text("0903768****"),
                                  Gap(4),
                                  Text(
                                    "1200 Rpt",
                                    style: TextStyle(color: Colors.orange),
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Gap(80),
                                  winners(
                                    position: '3',
                                    userImage:
                                        "https://media.istockphoto.com/photos/smiling-black-guy-using-smartphone-wearing-african-tshirt-picture-id1256457468?s=612x612",
                                  ),
                                  Gap(15),
                                  Text("0903768****"),
                                  Gap(4),
                                  Text(
                                    "1200 Rpt",
                                    style: TextStyle(color: Colors.orange),
                                  )
                                ],
                              )
                            ],
                          ),

                          const Gap(20),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: 13,
                            itemBuilder: (BuildContext context, int position) {
                              return referralItem();
                            },
                          ),
                        ]))
                    // ),
                    )));
  }

  Widget todayHighPlayerList(bool showToday) {
    return SlideInAnimation(
        duration: const Duration(milliseconds: 600),
        child: Column(
          children: [],
        ));
  }

  Widget weekHighPlayerList() {
    return Column(
      children: [],
    );
  }

  Widget monthHighPlayersList() {
    return Column(
      children: [],
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
                fit: BoxFit.fitHeight,
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
          left: 28,
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


  Widget referralItem() {
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
                  Column(children: [
                    Text(
                      "4",
                      style: TextStyle(
                        fontSize: 13,
                        color:   Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],),
                  Column(children: [
                    Container(
                      height: 44,
                      width: 44,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white12,
                        image: DecorationImage(
                          image: NetworkImage("https://images.unsplash.com/photo-1590339480061-4e9abd5bc0ae?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387"),
                          fit: BoxFit.fitHeight,
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                  ],),
                  Column(children: [
                    Text(
                      "0903768****",
                      style: TextStyle(
                        fontSize: 13,
                        color:   Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],),
                  Column(children: [
                    Text(
                      "856 Rpt",
                      style: TextStyle(
                        fontSize: 13,
                        color: const Color(0xFFFE7A01).withOpacity(.7),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],),



                ]),
            const Gap(10),
          ],
        ));
  }

}
