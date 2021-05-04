import 'dart:async';

import 'package:fal/constants.dart';
import 'package:fal/functions.dart';
import 'package:flutter/material.dart';

class RotatingLogo extends StatefulWidget {
  @override
  RotatingLogoState createState() => RotatingLogoState();
}

class RotatingLogoState extends State<RotatingLogo>
    with TickerProviderStateMixin {
  AnimationController rotationController;
  Timer _timer;
  RotatingLogoState() {
    _timer = new Timer(const Duration(milliseconds: 1200), () {
      setState(() {
        rotationController.stop();
        Navigator.pushNamedAndRemoveUntil(context, viewPath(), (e) => false);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    rotationController =
        AnimationController(duration: const Duration(seconds: 5), vsync: this);
    rotationController.repeat();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return new Container(
        height: size.height,
        width: double.infinity,
        child: Stack(alignment: Alignment.center, children: [
          Container(
              child: new AnimatedBuilder(
            animation: rotationController,
            child: new Container(
              height: 150.0,
              width: 150.0,
              child: new Image.asset('assets/images/logo.png'),
            ),
            builder: (BuildContext context, Widget _widget) {
              return new Transform.rotate(
                angle: rotationController.value * 6.3,
                child: _widget,
              );
            },
          )),
        ]));
  }
}
