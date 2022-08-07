import 'package:flutter/material.dart';
import 'package:flutter_ui_collections/modules/dashboard/widgets/tab_bar.dart';
import 'package:flutter_ui_collections/widgets/custom_colors.dart';
import 'package:flutter_ui_collections/widgets/heading.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Heading(
            'My Dashboard',
            type: HeadingType.h4,
          ),
          backgroundColor: CustomColors.darkBackground,
          actions: <Widget>[
            IconButton(
                tooltip: 'Settings',
                onPressed: (() {}),
                icon: const Icon(Icons.settings))
          ],
          bottom: DashboardTabBar(),
        ),
        body: Container(
            padding: const EdgeInsets.all(16),
            color: CustomColors.darkBackground,
            child: const TabBarView(
              children: [
                Icon(
                  Icons.directions_car,
                  color: Colors.white,
                ),
                Icon(Icons.directions_transit, color: Colors.white),
                Icon(Icons.directions_bike, color: Colors.white),
              ],
            )),
      ),
    );
  }
}
