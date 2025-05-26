import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:gemq_flutter/pages/home_screen.dart';
import 'package:gemq_flutter/pages/rent_screen.dart';
import 'package:gemq_flutter/pages/history_screen.dart';
import 'package:gemq_flutter/pages/profile_screen.dart';

class NavButton extends StatefulWidget {
  const NavButton({super.key});

  @override
  State<NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<NavButton> {
  int _pagesIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    RentScreen(),
    HistoryScreen(),
    ProfileScreen(),
  ];

  final iconList = <IconData>[
    Icons.home_rounded,
    Icons.list_alt_outlined,
    Icons.history_rounded,
    Icons.person_rounded,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: _pages[_pagesIndex],

      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Color(0xFF012748),
                width: 2.0,
              )
            )
          ),
          child: AnimatedBottomNavigationBar(
            icons: iconList,
            activeIndex: _pagesIndex,
            leftCornerRadius: 32,
            rightCornerRadius: 32,
            gapLocation: GapLocation.none,
            notchSmoothness: NotchSmoothness.defaultEdge,
            activeColor: const Color(0xFF7965C1),
            inactiveColor: Colors.grey.shade400,
            backgroundColor: Colors.white,
            elevation: 0,
            iconSize: 28,
            onTap: (index) => setState(() => _pagesIndex = index),
          ),
        ),
      ),
    );
  }
}
