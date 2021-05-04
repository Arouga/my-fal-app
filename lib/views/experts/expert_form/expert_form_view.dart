import 'package:fal/dictionnary.dart';
import 'package:fal/functions.dart';
import 'package:fal/views/experts/expert_form/components/body.dart';
import 'package:flutter/material.dart';

class ExpertFormtView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslation("add_expert_title", lang.languageCode)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
          ),
        ),
        toolbarHeight: 60,
      ),
      body: Body(),
    );
  }
}
