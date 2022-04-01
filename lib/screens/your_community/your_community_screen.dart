import 'package:flutter/material.dart';
import 'package:map_demo/screens/your_community/Tabs/explore_screen.dart';
import 'package:map_demo/screens/your_community/Tabs/highlights_screen.dart';
import 'package:map_demo/screens/your_community/Tabs/your_feed.dart';
import 'package:map_demo/utils/global_variables.dart';
import 'package:map_demo/widgets/app_bar.dart' as custom_app_bar;

class YourCommunityScreen extends StatefulWidget {
  const YourCommunityScreen({Key? key}) : super(key: key);

  final _appBarTitle = "Your Community";

  @override
  State<YourCommunityScreen> createState() => _YourCommunityScreenState();
}

class _YourCommunityScreenState extends State<YourCommunityScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: kYourCommunityTabs.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: custom_app_bar.POMAppBar(
        title: widget._appBarTitle,
        tabs: kYourCommunityTabs,
        tabController: _tabController,
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: const [YourFeed(), HighLightsScreen(), ExploreScreen()],
      ),
    );
  }
}
