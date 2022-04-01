import 'package:flutter/material.dart';
import 'package:map_demo/screens/you/Tabs/report_incident.dart';
import 'package:map_demo/screens/you/Tabs/your_activity.dart';
import 'package:map_demo/utils/global_variables.dart';
import 'package:map_demo/widgets/app_bar.dart' as custom_app_bar;

class YouScreen extends StatefulWidget {
  const YouScreen({Key? key}) : super(key: key);

  final String _appBarTitle = "Safe Map";

  @override
  State<YouScreen> createState() => _YouScreenState();
}

class _YouScreenState extends State<YouScreen>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late TabController _tabController;

  @override
  bool get wantKeepAlive => true;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: kHomeScreenTabs.length,
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
        tabs: kHomeScreenTabs,
        tabController: _tabController,
        widgets: [
          Container(
            height: 5,
            width: 5,
            decoration: BoxDecoration(
              color: Colors.orange[400],
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.black87.withOpacity(0.75),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
          ),
        ],
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: const [
          YourActivity(),
          ReportIncident(),
        ],
      ),
    );
  }
}
