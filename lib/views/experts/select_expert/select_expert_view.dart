import 'package:fal/constants.dart';
import 'package:fal/dictionnary.dart';
import 'package:fal/functions.dart';
import 'package:fal/views/experts/select_expert/components/body.dart';
import 'package:flutter/material.dart';

class SelectExpertView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    BodyState body = BodyState();
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslation("select_expert_title", lang.languageCode)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
          ),
        ),
        toolbarHeight: 60,
      ),
      body: body.build(context),
      bottomNavigationBar: new Stack(
        alignment: new FractionalOffset(.5, 1.0),
        children: [
          new Container(
            height: 60.0,
            width: size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(50)),
              color: primaryColor,
            ),
            child: new FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, '/add_expert');
              },
              child: new Icon(Icons.add),
              splashColor: Colors.black12,
            ),
          ),
        ],
      ),
    );
  }
}
