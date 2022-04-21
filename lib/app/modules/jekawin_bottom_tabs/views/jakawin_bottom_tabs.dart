import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jekawin_mobile_flutter/app/modules/e_shop/views/e_shop_view.dart';
import 'package:jekawin_mobile_flutter/app/modules/walllet_home/views/wallet_home_view.dart';

class JekawinBottomTabs extends StatefulWidget {
  final int tabIndex;

  const JekawinBottomTabs({Key? key, this.tabIndex = 0}) : super(key: key);
  @override
  _JekawinBottomTabsState createState() => _JekawinBottomTabsState();
}

class _JekawinBottomTabsState extends State<JekawinBottomTabs> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  int _currentIndex = 0;
  final List<Map<String, dynamic>> _children = [];

  @override
  void initState() {
    _children.add({
      "title": "Home",
      "widget": Container(),
    });
    _children.add({
      "title": "Leaderboard",
      "widget": Container(),
    });
    _children.add({
      "title": "Wallet",
      "widget":const WalletHomeView(),
    });
    _children.add({
      "title": "E-shop",
      "widget": const EShopView(),
    });
    _children.add({
      "title": "More",
      "widget": Container(),
    });
    _currentIndex = widget.tabIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xFFFAFAFB),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            selectedItemColor: const Color(0xFFFE7A01),
            unselectedItemColor: const Color(0xff747B84),
            onTap: (int index) {
              HapticFeedback.selectionClick();
              setState(() => _currentIndex = index);
            },
            unselectedLabelStyle: TextStyle(
              height: 1.8,
              letterSpacing: .5,
              fontSize: 8,
              fontWeight: FontWeight.normal,
              color: Colors.grey.withOpacity(0.5),
            ),
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: const TextStyle(
              fontSize: 8,
              letterSpacing: .5,
              color: Color(0xFFFE7A01),
              fontWeight: FontWeight.normal,
              height: 1.8,
            ),
            backgroundColor: Colors.white,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/svgs/home.svg',
                  color: _currentIndex == 0
                      ? const Color(0xFFFE7A01)
                      : const Color(0xff747B84),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/svgs/Vector.svg',
                  color: _currentIndex == 1
                      ? const Color(0xFFFE7A01)
                      : const Color(0xff747B84),
                  height: 22,
                ),
                label: 'Leaderboard',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/svgs/wallet_.svg',
                  height: 20,
                  color: _currentIndex == 2
                      ? const Color(0xFFFE7A01)
                      : const Color(0xff747B84),
                ),
                label: 'Wallet',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/svgs/clarity_shopping-cart-line.svg',
                  color: _currentIndex == 3
                      ? const Color(0xFFFE7A01)
                      : const Color(0xff747B84),
                ),
                label: 'E-shop',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/svgs/more.svg',
                  color: _currentIndex == 4
                      ? const Color(0xFFFE7A01)
                      : const Color(0xff747B84),
                ),
                label: 'More',
              ),
            ],
          ),
        ),
      ),
      body: _children.length >= 3
          ? _children[_currentIndex]['widget']
          : Container(),
    );
  }
}
