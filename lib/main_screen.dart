import 'package:flutter/material.dart';
import 'package:map_demo/utils/global_variables.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final bottomNavBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: const Icon(Icons.emoji_people_rounded),
        label: _currentTabIndex == 0 ? "You" : "Around You",
      ),
      const BottomNavigationBarItem(
          icon: Icon(
            Icons.security_rounded,
          ),
          label: "Your people"),
      const BottomNavigationBarItem(
          icon: Icon(Icons.people_alt_rounded), label: "Your community")
    ];
    assert(kHomeScreenPages.length == bottomNavBarItems.length);
    final bottomNavBar = BottomNavigationBar(
      elevation: 32,
      items: bottomNavBarItems,
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentTabIndex,
      onTap: (int index) {
        setState(() {
          _currentTabIndex = index;
        });
      },
    );

    return Scaffold(
      body: kHomeScreenPages[_currentTabIndex],
      bottomNavigationBar: bottomNavBar,
    );
  }
}
