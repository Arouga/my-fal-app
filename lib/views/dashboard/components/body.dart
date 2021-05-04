import 'package:fal/constants.dart';
import 'package:fal/dictionnary.dart';
import 'package:fal/functions.dart';
import 'package:fal/models/parallax_card_item.dart';
import 'package:fal/widgets/dashboard_bar_chart.dart';
import 'package:fal/widgets/stats_grid.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  BodyState createState() => BodyState();
}

class BodyState extends State<Body> {
  final myController = TextEditingController();
  static List<ParallaxCardItem> parallaxCardItemsList = <ParallaxCardItem>[];
  void addItem(ParallaxCardItem item) {
    parallaxCardItemsList.add(item);
  }

  @override
  Widget build(BuildContext context) {
    final data = [12.17, 11.15, 10.02, 11.21, 13.83, 14.16, 14.30];

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: primaryColor,
        child: CustomScrollView(
          physics: ClampingScrollPhysics(),
          slivers: [
            _buildStatsTabBar(),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              sliver: SliverToBoxAdapter(
                child: StatsGrid(),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(top: 20.0),
              sliver: SliverToBoxAdapter(
                child: DashboardBarChart(data: data),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

SliverPadding _buildStatsTabBar() {
  return SliverPadding(
    padding: const EdgeInsets.all(20.0),
    sliver: SliverToBoxAdapter(
      child: DefaultTabController(
        length: 3,
        child: TabBar(
          indicatorColor: Colors.transparent,
          labelStyle: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white60,
          tabs: <Widget>[
            Text(
              getTranslation('total_button', lang.languageCode),
            ),
            Text(
              getTranslation('today_button', lang.languageCode),
            ),
            Text(
              getTranslation('yesterday_button', lang.languageCode),
            ),
          ],
          onTap: (index) {},
        ),
      ),
    ),
  );
}
