import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:srocksproject/screens/homescreen.dart';
import 'package:srocksproject/screens/newspage.dart';
import 'package:srocksproject/screens/projectspage.dart';
import 'package:srocksproject/screens/trackboxpage.dart';
import '../viewmodels/service_viewmodel.dart';
import '../widgets/bottomNavBar.dart';


class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int _currentIndex = 0;
  bool _hasFetched = false;

  // List of screens to switch between
  final List<Widget> _screens = [
    HomeScreen(),
    Newspage(),
    Trackboxpage(),
    Projectspage(),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_hasFetched) {
        Provider.of<ServiceViewModel>(context, listen: false).fetchServices();
        _hasFetched = true;
      }
    });
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff18171C),
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}