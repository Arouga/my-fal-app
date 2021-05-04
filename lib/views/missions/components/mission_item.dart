import 'package:badges/badges.dart';
import 'package:fal/functions.dart';
import 'package:fal/models/mission.dart';
import 'package:fal/views/missions/components/edit_mission/edit_mission_view.dart';
import 'package:flutter/material.dart';
import 'package:fal/constants.dart';

import 'package:fal/dictionnary.dart';

class MissionItem extends StatefulWidget {
  @override
  MissionItemState createState() => MissionItemState();
}

class MissionItemState extends State<MissionItem> {
  Mission mission;
  MissionItemState({Key key, this.mission});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Wrap(
          children: [
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              margin: EdgeInsets.symmetric(vertical: 10),
              width: size.width * 0.9,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30)),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    ExpansionTile(
                      title: Column(children: [
                        Text(
                          f.format(DateTime.now()).toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                        Chip(
                          padding: EdgeInsets.all(0),
                          backgroundColor: Colors.orangeAccent,
                          label: Text('En attente de confirmation',
                              style: TextStyle(color: Colors.white)),
                        ),
                        Text(
                            this.mission.assure.nom[0] +
                                ". " +
                                this.mission.assure.prenom +
                                " - " +
                                mission.vehicule +
                                "-" +
                                mission.pointChock,
                            style: TextStyle(color: Colors.white)),
                      ]),
                      leading: Icon(
                        Icons.speed_rounded,
                        color: Colors.white,
                      ),
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(left: 30.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.person,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                      this.mission.assure.nom[0] +
                                          ". " +
                                          this.mission.assure.prenom,
                                      style: TextStyle(
                                        color: Colors.white,
                                      )),
                                  const SizedBox(height: 35)
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.car_repair,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                      mission.vehicule +
                                          "-" +
                                          mission.pointChock,
                                      style: TextStyle(
                                        color: Colors.white,
                                      )),
                                  const SizedBox(height: 35)
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.featured_play_list,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text(this.mission.assure.cin,
                                      style: TextStyle(
                                        color: Colors.white,
                                      )),
                                  const SizedBox(height: 35)
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.smartphone,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text(this.mission.assure.tel,
                                      style: TextStyle(
                                        color: Colors.white,
                                      )),
                                  const SizedBox(height: 35)
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            EditMissionViewState(
                                                    mission: this.mission)
                                                .build(context)));
                              },
                              child: Row(children: [
                                Icon(Icons.edit_rounded),
                                const SizedBox(width: 15),
                                Text("Edit")
                              ])),
                          const SizedBox(width: 15),
                        ]),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
