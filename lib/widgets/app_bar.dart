import 'package:flutter/material.dart';
import 'package:map_demo/utils/colors.dart';

class POMAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor = kAppBarColor;
  final String title;
  final List<Widget> widgets;
  final List<Tab> tabs;
  final TabController tabController;

  const POMAppBar({
    Key? key,
    required this.title,
    required this.tabs,
    required this.tabController,
    this.widgets = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(color: Colors.black54, fontSize: 24),
      ),
      backgroundColor: backgroundColor,
      actions: widgets,
      elevation: 0,
      bottom: TabBar(
        tabs: tabs,
        controller: tabController,
        indicatorColor: Colors.white,
        indicatorPadding: const EdgeInsets.symmetric(horizontal: 30),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
