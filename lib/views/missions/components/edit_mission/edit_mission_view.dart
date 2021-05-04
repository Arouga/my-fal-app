import 'package:fal/constants.dart';
import 'package:fal/dictionnary.dart';
import 'package:fal/functions.dart';
import 'package:fal/models/mission.dart';
import 'package:fal/views/missions/components/edit_mission/components/mission_details.dart';
import 'package:flutter/material.dart';

class EditMissionView extends StatefulWidget {
  @override
  EditMissionViewState createState() => EditMissionViewState();
}

class EditMissionViewState extends State<EditMissionView> {
  Mission mission;
  EditMissionViewState({Key key, this.mission});
  State body;
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    this.body = new MissionDetailsState(mission: mission);
    return Scaffold(
      appBar: AppBar(
        title: Text(this.mission.assure.nom[0] +
            ". " +
            this.mission.assure.prenom +
            " - " +
            mission.vehicule +
            "-" +
            mission.pointChock),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
          ),
        ),
        toolbarHeight: 60,
      ),
      body: body.build(context),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            backgroundColor: primaryColor,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white70,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.info),
                label: 'Details',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.image_rounded),
                label: 'Photos',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
