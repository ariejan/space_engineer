import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:space_engineer/i18n/translations.dart';
import 'package:space_engineer/ui/building_view/building_view.dart';
import 'package:space_engineer/ui/environment_view/environment_view.dart';
import 'package:space_engineer/ui/progress_view/progress_view.dart';
import 'package:space_engineer/ui/research_view/research_view.dart';
import 'package:space_engineer/ui/mining_view/mining_view.dart';

class TabbedView extends StatefulWidget {
  @override
  _TabbedViewState createState() => _TabbedViewState();
}

class _TabbedViewState extends State<TabbedView>
  with SingleTickerProviderStateMixin {

  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(Translations.of(context).appTitle),
        ),
        bottom: TabBar(
          unselectedLabelColor: Colors.amber.shade800,
          labelColor: Colors.amber.shade50,
          tabs: [
            Tab(icon: FaIcon(FontAwesomeIcons.hardHat)),
            Tab(icon: FaIcon(FontAwesomeIcons.industry)),
            Tab(icon: FaIcon(FontAwesomeIcons.flask)),
            Tab(icon: FaIcon(FontAwesomeIcons.seedling)),
            Tab(icon: FaIcon(FontAwesomeIcons.rocket)),
          ],
          controller: _tabController,
        ),
      ),
        body: TabBarView(
          children: [
            MiningView(),
            BuildingView(),
            ResearchView(),
            EnvironmentView(),
            ProgressView(),
          ],
          controller: _tabController,
        )
    );
  }
}

