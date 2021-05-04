import 'package:fal/functions.dart';
import 'package:fal/models/expert.dart';
import 'package:fal/services/expert_service.dart';
import 'package:fal/views/experts/select_expert/components/expert_item.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class Body extends StatefulWidget {
  @override
  BodyState createState() => BodyState();
}

class BodyState extends State<Body> {
  List<ExpertItemState> expertList = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        height: size.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            ListView.builder(
                itemCount: experts.length,
                itemBuilder: (BuildContext context, int index) {
                  Expert e = Expert().fromMap(jsonDecode(experts[index]));

                  return SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Dismissible(
                          background: Container(
                            decoration: BoxDecoration(
                              color: Colors.red,
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
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                )
                              ],
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            alignment: AlignmentDirectional.centerStart,
                            child: Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                          secondaryBackground: Container(
                            decoration: BoxDecoration(
                              color: Colors.red,
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
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                )
                              ],
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            alignment: AlignmentDirectional.centerEnd,
                            child: Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                          key: Key(e.key),
                          onDismissed: (direction) async {
                            experts.remove(experts[index]);
                            await updateExperts(experts);

                            if (experts.isEmpty)
                              Navigator.pushNamedAndRemoveUntil(
                                  context, viewPath(), (route) => false);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(e.expertName + " deleted"),
                              backgroundColor: Colors.red,
                            ));
                          },
                          child: ExpertItemState(expert: e, body: this)
                              .build(context),
                        ),
                      ],
                    ),
                  );
                })
          ],
        ));
  }
}
