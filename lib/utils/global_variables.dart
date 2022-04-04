import 'package:flutter/material.dart';
import 'package:map_demo/screens/You/you_screen.dart';
import 'package:map_demo/screens/your_community/your_community_screen.dart';
import 'package:map_demo/screens/your_people/your_people_screen.dart';
import 'package:map_demo/utils/styles.dart';

const double kYouActivityAppBarHeight = 100;

final kHomeScreenPages = <Widget>[
  const YouScreen(),
  const YourPeopleScreen(),
  const YourCommunityScreen()
];

final kHomeScreenTabs = <Tab>[
  const Tab(
    iconMargin: EdgeInsets.zero,
    child: Text(
      "Live Activity",
      style: kTabLabelTextStyle,
    ),
  ),
  const Tab(
    child: Text(
      "Report Incident",
      style: kTabLabelTextStyle,
    ),
  ),
];

final kYourCommunityTabs = <Tab>[
  const Tab(
    child: Text(
      "Your Feed",
      style: kTabLabelTextStyle,
    ),
  ),
  const Tab(
    child: Text(
      "Highlights",
      style: kTabLabelTextStyle,
    ),
  ),
  const Tab(
    child: Text(
      "Explore",
      style: kTabLabelTextStyle,
    ),
  )
];
