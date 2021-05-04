import 'dart:convert';

import 'package:fal/constants.dart';
import 'package:fal/dictionnary.dart';
import 'package:fal/functions.dart';
import 'package:fal/models/user.dart';
import 'package:fal/views/dashboard/dashboard_view.dart';
import 'package:fal/views/missions/all_missions_view.dart';
import 'package:fal/widgets/change_lang.dart';
import 'package:flutter/material.dart';

enum DrawerSelection { dashboard, all_missions, express_mission }

class MainView extends StatefulWidget {
  @override
  MainViewState createState() => MainViewState();
}

class MainViewState extends State<MainView> {
  State selectedView = DashboardViewState();
  String viewTitle = "dashboard_title";
  String selectedViewTitle =
      getTranslation("dashboard_title", lang.languageCode);
  DrawerSelection _drawerSelection = DrawerSelection.dashboard;

  @override
  Widget build(BuildContext context) {
    selectedView = selectedView;
    selectedViewTitle = selectedViewTitle;
    viewTitle = viewTitle;
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedViewTitle),
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.only(
        //     bottomRight: Radius.circular(50),
        //   ),
        // ),
        elevation: 0,
        bottomOpacity: 0,
        toolbarHeight: 60,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    height: 100,
                    width: 100,
                  ),
                  Text(
                    User().fromMap(jsonDecode(user)).email,
                    style: TextStyle(color: primaryLightColor),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            ListTile(
              selected: _drawerSelection == DrawerSelection.dashboard,
              leading: Icon(Icons.dashboard_rounded),
              title: Text(
                getTranslation("dashboard_title", lang.languageCode),
              ),
              onTap: () {
                _drawerSelection = DrawerSelection.dashboard;
                selectedView = new DashboardViewState();
                viewTitle = "dashboard_title";
                selectedViewTitle =
                    getTranslation(viewTitle, lang.languageCode);

                Navigator.pop(context);
              },
            ),
            ExpansionTile(
              initiallyExpanded:
                  _drawerSelection == DrawerSelection.all_missions,
              leading: Icon(Icons.assignment_rounded),
              title: Text(
                getTranslation("mission_title", lang.languageCode),
              ),
              children: [
                ListTile(
                  leading: Icon(Icons.assignment_rounded),
                  selected: _drawerSelection == DrawerSelection.all_missions,
                  title: Text("All missions"),
                  onTap: () {
                    _drawerSelection = DrawerSelection.all_missions;
                    selectedView = new AllMissionsViewState();
                    viewTitle = "mission_title";
                    selectedViewTitle =
                        getTranslation(viewTitle, lang.languageCode);

                    Navigator.pop(context);
                  },
                )
              ],
            ),
            ListTile(
              selected: _drawerSelection == DrawerSelection.express_mission,
              leading: Icon(Icons.speed),
              title: Text(
                getTranslation("express_folder_title", lang.languageCode),
              ),
              onTap: () {
                _drawerSelection = DrawerSelection.express_mission;

                Navigator.pop(context);
              },
            ),
            Container(
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: ListTile(
                leading: Icon(
                  Icons.exit_to_app,
                  color: Colors.white,
                ),
                title: Text(
                  getTranslation("logout_button", lang.languageCode),
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  user = 'null';
                  updateUser(user);
                  Navigator.pushNamedAndRemoveUntil(
                      context, viewPath(), (route) => false);
                },
              ),
            ),
            Align(
              child: ChangeLang(refresh: () {
                if (this.mounted) this.setState(() {});
                selectedViewTitle =
                    getTranslation(viewTitle, lang.languageCode);
                Navigator.pop(context);
              }),
              alignment: Alignment.bottomLeft,
            )
          ],
        ),
      ),
      body: selectedView.build(context),
    );
  }
}
