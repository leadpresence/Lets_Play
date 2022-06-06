import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jekawin_mobile_flutter/app/modules/jekawin_club/views/mobile/widgets/home/suggest_events.dart';
import 'package:jekawin_mobile_flutter/app/widgets/custom_large_button.dart';

import 'jekawin_club_event.dart';

class JekawinClubHome extends StatelessWidget {
  const JekawinClubHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          left: 24.0,
          right: 24.0,
          bottom: 24.0,
          top: 8.0,
        ),
        child: Row(
          children: [
            Expanded(
              child: CustomButton(
                hasBorder: true,
                onPressed: () {
                   Get.to(
                    () => const SuggestEvents(),
                    transition: Transition.cupertino,
                  );
                },
                borderColor: const Color(0xffFE7A01),
                buttonColor: Colors.white,
                buttonTextColor: const Color(0xffFE7A01),
                buttonText: 'Suggest Events',
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: CustomButton(
                onPressed: () {
                  Get.to(
                    () => const JekawinClubEvent(),
                    transition: Transition.cupertino,
                  );
                },
                buttonText: 'View Events',
              ),
            )
          ],
        ),
      ),
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
              const Text(
                'Jekawin Bronze Club',
                style: TextStyle(
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
                  memberCard(
                      image:
                          'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260',
                      name: 'Me'),
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    'Club Members',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
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
                      memberCard(
                          image:
                              'https://images.pexels.com/photos/997489/pexels-photo-997489.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260',
                          name: 'Olamide'),
                      memberCard(
                          image:
                              'https://images.pexels.com/photos/3778603/pexels-photo-3778603.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260',
                          name: 'Wale'),
                      memberCard(
                          image:
                              'https://images.pexels.com/photos/3965240/pexels-photo-3965240.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260',
                          name: 'Roy'),
                      memberCard(
                          image:
                              'https://images.pexels.com/photos/3951774/pexels-photo-3951774.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260',
                          name: 'Maurice'),
                      memberCard(
                          image:
                              'https://images.pexels.com/photos/749091/pexels-photo-749091.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260',
                          name: 'Gideon'),
                      memberCard(
                          image:
                              'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260',
                          name: 'D\' Law'),
                      memberCard(
                          image:
                              'https://images.pexels.com/photos/3454835/pexels-photo-3454835.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260',
                          name: 'Rachael'),
                      memberCard(
                          image:
                              'https://images.pexels.com/photos/997505/pexels-photo-997505.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260',
                          name: 'Oyen'),
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
