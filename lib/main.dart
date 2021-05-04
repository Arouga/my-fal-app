import 'package:fal/functions.dart';
import 'package:fal/views/dashboard/dashboard_view.dart';
import 'package:fal/views/experts/expert_form/expert_form_view.dart';
import 'package:fal/views/launcher/launcher_view.dart';
import 'package:fal/views/login/login_view.dart';
import 'package:fal/views/experts/select_expert/select_expert_view.dart';
import 'package:fal/views/main/main_view.dart';
import 'package:fal/views/missions/all_missions_view.dart';
import 'package:fal/views/missions/components/edit_mission/edit_mission_view.dart';
import 'package:fal/views/welcome/welcome_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  String initialView;
  @override
  Widget build(BuildContext context) {
    setExperts();
    setSelectedExpert();
    setUser();
    getLang([this]);
    return MaterialApp(
      title: 'FAL',
      theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          brightness: Brightness.light,
          fontFamily: "Oxygen"),
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.deepOrange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: "Oxygen"),
      themeMode: ThemeMode.light,
      initialRoute: '/',
      routes: {
        '/': (context) => LauncherView(),
        '/home': (context) => WelcomeView(),
        '/select_expert': (context) => SelectExpertView(),
        '/add_expert': (context) => ExpertFormtView(),
        '/login': (context) => LoginView(),
        '/main': (context) => MainView(),
        '/dashboard': (context) => DashboardView(),
        '/all_missions': (context) => AllMissionsView(),
        '/edit_mission': (context) => EditMissionView(),
      },
    );
  }
}
