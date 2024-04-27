import 'package:flutter/material.dart';
import 'package:light_bottom_navigation_bar/light_bottom_navigation_bar.dart';
import 'package:poll_app/core/theme/app_palette.dart';
import 'package:poll_app/features/new_poll/presentation/pages/new_poll_page.dart';
import 'package:poll_app/features/poll_list/presentation/pages/poll_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _bottomNavIndex = 0;

  List<Widget> widgetList = const [
    NewPollPage(),
    PollList(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetList[_bottomNavIndex],
      bottomNavigationBar: LightBottomNavigationBar(
        items: [
          bottomNavItem1(),
          bottomNavItem2(),
        ],
        onSelected: (index) {
          setState(() {
            _bottomNavIndex = index;
          });
        },
      ),
    );
  }

  LightBottomNavigationBarItem bottomNavItem1() {
    return const LightBottomNavigationBarItem(
        backgroundShadowColor: AppPalette.kWhite,
        borderBottomColor: AppPalette.kWhite,
        splashColor: AppPalette.kWhite,
        unSelectedIcon: Icons.add,
        selectedIcon: Icons.add);
  }

  LightBottomNavigationBarItem bottomNavItem2() {
    return const LightBottomNavigationBarItem(
        backgroundShadowColor: AppPalette.kWhite,
        borderBottomColor: AppPalette.kWhite,
        splashColor: AppPalette.kWhite,
        unSelectedIcon: Icons.poll_outlined,
        selectedIcon: Icons.poll_outlined);
  }
}
