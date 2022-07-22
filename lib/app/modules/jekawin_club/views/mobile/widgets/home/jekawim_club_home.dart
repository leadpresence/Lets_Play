import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jekawin_mobile_flutter/app/modules/jekawin_club/views/mobile/widgets/home/suggest_events.dart';
import 'package:jekawin_mobile_flutter/app/widgets/custom_large_button.dart';

import '../../../../models/get_club_members_response_model.dart';
import 'jekawin_club_event.dart';

class JekawinClubHome extends StatelessWidget {
  final GetAllClubMembersResponseModel membersBody;
  const JekawinClubHome({Key? key, required this.membersBody})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var currentUserID = GetStorage().read("currentUserID");
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 3;
    final double itemWidth = size.width / 2;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
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
      ),
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.only(
      //     left: 24.0,
      //     right: 24.0,
      //     bottom: 24.0,
      //     top: 8.0,
      //   ),
      //   child: Row(
      //     children: [
      //       Expanded(
      //         child: CustomButton(
      //           hasBorder: true,
      //           onPressed: () {
      //             Get.to(
      //               () => const SuggestEvents(),
      //               transition: Transition.cupertino,
      //             );
      //           },
      //           borderColor: const Color(0xffFE7A01),
      //           buttonColor: Colors.white,
      //           buttonTextColor: const Color(0xffFE7A01),
      //           buttonText: 'Suggest Events',
      //         ),
      //       ),
      //       const SizedBox(width: 16),
      //       Expanded(
      //         child: CustomButton(
      //           onPressed: () {
      //             Get.to(
      //               () => const JekawinClubEvent(),
      //               transition: Transition.cupertino,
      //             );
      //           },
      //           buttonText: 'View Events',
      //         ),
      //       )
      //     ],
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Container(
          width: Get.width,
          padding: const EdgeInsets.only(
            left: 24.0,
            right: 24.0,
            top: 12.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Jekawin ${membersBody.data.clubName}',
                style: const TextStyle(
                  fontSize: 24,
                  color: Color(0xff414249),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      for (int i = 0; i < membersBody.data.members.length; i++)
                        membersBody.data.members[i].userId.id == currentUserID
                            ? memberCard(
                                image: membersBody
                                    .data.members[i].userId.profileUrl,
                                name: 'Me')
                            : const SizedBox(),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      membersBody.data.members.isEmpty
                          ? const SizedBox()
                          : const Text(
                              'Club Members',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.start,
                            ),
                      GridView.count(
                        childAspectRatio: (itemWidth / itemHeight),
                        controller: ScrollController(keepScrollOffset: false),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        crossAxisCount: 3,
                        padding: const EdgeInsets.symmetric(
                          // horizontal: 12.0,
                          vertical: 12.0,
                        ),
                        children: [
                          for (int i = 0;
                              i < membersBody.data.members.length;
                              i++)
                            membersBody.data.members[i].userId.id !=
                                    currentUserID
                                ? memberCard(
                                    image: membersBody
                                        .data.members[i].userId.profileUrl,
                                    name: membersBody
                                        .data.members[i].userId.firstName,
                                  )
                                : const SizedBox(),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget memberCard({image, name}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 8.0,
                bottom: 8.0,
                right: 8.0,
              ),
              child: CircleAvatar(
                radius: 42,
                backgroundColor: Colors.black12,
                child: CircleAvatar(
                  radius: 41,
                  backgroundColor: Colors.white,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white12,
                      image: DecorationImage(
                        image: NetworkImage(
                          image,
                        ),
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              child: Container(
                margin: const EdgeInsets.only(top: 4, right: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  // color: switchPrimaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.03),
                      blurRadius: 3,
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: SvgPicture.asset(
                  'assets/svgs/member_icon.svg',
                ),
              ),
            ),
          ],
        ),
        Text(
          name,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
