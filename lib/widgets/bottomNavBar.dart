import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      backgroundColor: const Color(0xff18171C),
      selectedItemColor: Colors.white,
      unselectedItemColor: Color(0xff61616B),
      selectedLabelStyle: const TextStyle(
        fontFamily: 'Syne',
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: const TextStyle(
        fontFamily: 'Syne',
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/images/srocks_icon.png',
            height: 24,
            width: 24,
            color: Color(0xff61616B),
          ),
          activeIcon: Image.asset(
            'assets/images/srocks_icon.png',
            height: 24,
            width: 24,
            color: Colors.white,
          ),
          label: 'Home',
        ),

        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/images/news_icon.png',
            height: 24,
            width: 24,
            color: Color(0xff61616B),
          ),
          activeIcon: Image.asset(
            'assets/images/news_icon.png',
            height: 24,
            width: 24,
            color: Colors.white,
          ),
          label: 'News',
        ),

        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/images/trackbox_icon.png',
            height: 24,
            width: 24,
            color: Color(0xff61616B),
          ),
          activeIcon: Image.asset(
            'assets/images/trackbox_icon.png',
            height: 24,
            width: 24,
            color: Colors.white,
          ),
          label: 'Trackbox',
        ),

        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/images/project_icon.png',
            height: 24,
            width: 24,
            color: Color(0xff61616B),
          ),
          activeIcon: Image.asset(
            'assets/images/project_icon.png',
            height: 24,
            width: 24,
            color: Colors.white,
          ),
          label: 'Projects',
        ),
      ],
    );
  }
}