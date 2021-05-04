import 'dart:convert';

import 'package:fal/functions.dart';
import 'package:fal/models/expert.dart';
import 'package:flutter/material.dart';
import 'package:fal/constants.dart';

import 'package:fal/dictionnary.dart';

class ExpertItem extends StatefulWidget {
  @override
  ExpertItemState createState() => ExpertItemState();
}

class ExpertItemState extends State<ExpertItem> {
  final Expert expert;
  final Color color, textColor;
  final State body;
  ExpertItemState(
      {Key key,
      this.expert,
      this.color = primaryColor,
      this.textColor = Colors.white,
      this.body});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
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
      width: size.width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  this.expert.expertLogo,
                  height: 150,
                ),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(this.expert.expertName, style: TextStyle(fontSize: 25)),
              // Text(this.expert.key)
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                const SizedBox(width: 8),
                TextButton(
                  child: Text(getTranslation(
                      'select_expert_button', lang.languageCode)),
                  onPressed: () {
                    selectedExpert = expert.toStringJson();
                    updateSelectedExpert(selectedExpert);
                    Navigator.pushNamedAndRemoveUntil(
                        context, viewPath(), (route) => false);
                  },
                ),
                const SizedBox(width: 30),
              ],
            ),
            const SizedBox(height: 30, width: 100)
          ],
        ),
      ),
    );
  }
}
