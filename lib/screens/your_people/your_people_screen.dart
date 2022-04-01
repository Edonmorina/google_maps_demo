import 'package:flutter/material.dart';
import 'package:map_demo/screens/your_people/Tabs/activity_screen.dart';
import 'package:map_demo/screens/your_people/Tabs/groups_screen.dart';
import 'package:map_demo/screens/your_people/Tabs/invitations_screen.dart';
import 'package:map_demo/utils/global_variables.dart';
import 'package:map_demo/utils/styles.dart';
import 'package:map_demo/widgets/app_bar.dart' as custom_app_bar;

class YourPeopleScreen extends StatefulWidget {
  const YourPeopleScreen({Key? key}) : super(key: key);

  final _appBarTitle = "Your people";

  @override
  State<YourPeopleScreen> createState() => _YourPeopleScreenState();
}

class _YourPeopleScreenState extends State<YourPeopleScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  int _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    print(_tabIndex);

    final kYourPeopleTabs = <Tab>[
      const Tab(
        child: Text(
          "Activity",
          style: kTabLabelTextStyle,
        ),
      ),
      const Tab(
        child: Text(
          "Groups",
          style: kTabLabelTextStyle,
        ),
      ),
      const Tab(
        child: Text(
          "Invitations",
          style: kTabLabelTextStyle,
        ),
      )
    ];
    return Scaffold(
      appBar: custom_app_bar.POMAppBar(
        title: widget._appBarTitle,
        tabs: kYourPeopleTabs,
        tabController: _tabController,
        widgets: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.person_add_alt_1,
                  size: 36,
                  color: Colors.black87,
                )),
          )
        ],
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: const [ActivityScreen(), GroupsScreen(), InvitationsScreen()],
      ),
    );
  }
}
