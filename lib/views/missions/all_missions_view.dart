import 'package:fal/views/missions/components/body.dart';
import 'package:flutter/material.dart';

class AllMissionsView extends StatefulWidget {
  @override
  AllMissionsViewState createState() => AllMissionsViewState();
}

class AllMissionsViewState extends State<AllMissionsView> {
  Body body = new Body();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
    );
  }
}
