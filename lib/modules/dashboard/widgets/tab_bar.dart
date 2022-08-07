import 'package:flutter/material.dart';
import 'package:flutter_ui_collections/widgets/custom_colors.dart';
import 'package:flutter_ui_collections/widgets/custom_text.dart';

class DashboardTabBar extends StatelessWidget implements PreferredSizeWidget {
  final List<String> tabs = ['Tab 1', 'Tab 2', 'Tab 3'];

  DashboardTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Container(
        margin: const EdgeInsets.only(left: 8, right: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: CustomColors.secondary),
        clipBehavior: Clip.hardEdge,
        child: Theme(
          data: ThemeData(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent),
          child: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: CustomColors.lightSecondary),
              labelColor: Colors.white,
              unselectedLabelColor: CustomColors.lightText,
              tabs: tabs
                  .map((label) => Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      padding: const EdgeInsets.only(
                          top: 6, right: 12, bottom: 6, left: 12),
                      child: CustomText(label)))
                  .toList()),
        )));
  }

  @override
  Size get preferredSize => const Size.fromHeight(48);
}
