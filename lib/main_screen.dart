import 'package:flutter/material.dart';
import 'package:map_demo/providers/google_maps_provider.dart';
import 'package:map_demo/utils/global_variables.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedPageIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    Provider.of<GoogleMapsProvider>(context, listen: false).setMapStyle();
    _pageController = PageController(initialPage: _selectedPageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomNavBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: const Icon(Icons.emoji_people_rounded),
        label: _selectedPageIndex == 0 ? "You" : "Around You",
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
      currentIndex: _selectedPageIndex,
      onTap: (int selectedPageIndex) {
        setState(() {
          _selectedPageIndex = selectedPageIndex;
          _pageController.jumpToPage(selectedPageIndex);
        });
      },
    );

    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: kHomeScreenPages,
      ),
      bottomNavigationBar: bottomNavBar,
    );
  }
}
