import 'package:fal/constants.dart';
import 'package:fal/dictionnary.dart';
import 'package:fal/functions.dart';
import 'package:flutter/material.dart';

class StatsGrid extends StatefulWidget {
  @override
  StatsGridState createState() => StatsGridState();
}

class StatsGridState extends State<StatsGrid> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Column(
        children: <Widget>[
          Flexible(
            child: Row(
              children: <Widget>[
                _buildStatCard(
                    getTranslation('all_missions_title', lang.languageCode),
                    '1.81 M',
                    Colors.lightBlue),
                _buildStatCard(
                    getTranslation('urgent_missions_title', lang.languageCode),
                    '105 K',
                    Colors.red),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: <Widget>[
                _buildStatCard(
                    getTranslation(
                        'finished_missions_title', lang.languageCode),
                    '391 K',
                    Colors.green),
                _buildStatCard(
                    getTranslation('active_missions_title', lang.languageCode),
                    '1.31 M',
                    Colors.orange),
                _buildStatCard(
                    getTranslation(
                        'canceled_missions_title', lang.languageCode),
                    'N/A',
                    Colors.purple),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Expanded _buildStatCard(String title, String count, MaterialColor color) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              count,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
